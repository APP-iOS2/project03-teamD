//
//  RervationStore.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/13.
//

import Foundation
import Firebase
import FirebaseFirestore

final class RervationStore : ObservableObject{
    @Published var data = [SellerReservation]()
    @Published var recentData = [SellerReservation]()
    @Published var selectedType = ReservationStateType.waitReservation
    @Published var canceldata = [SellerReservation]()
    @Published var waitldata = [SellerReservation]()
    @Published var confilmedldata = [SellerReservation]()
    @Published var isLoading: Bool = false
    let dbRef = Firestore.firestore().collection("Reservation")
    let sellerUid = AuthStore.userUid
    init() {
        Task {
            await fetchData() { success in
                if success {
                    self.isLoading = true
                }
            }
        }
    }
    
    @MainActor func fetchData(completion: @escaping (Bool) -> ()) async {
        do {
            let snapshot = try await dbRef.getDocuments()
            
            self.data = try snapshot.documents.compactMap {
                try $0.data(as: SellerReservation.self)
            }
            filterData(completion: completion)
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
    func filterData(completion: @escaping (Bool) -> ()){
        let mydata = data.filter { data in
            data.placeID == sellerUid
        }
        
        let data = mydata.sorted {
            $0.reservationDateString > $1.reservationDateString
        }
        
        let canceldata = data.filter{
            $0.reservationState == 4
            //여기서 나온 값들 중에 최신값
        }
        self.canceldata = canceldata
        let waitldata = data.filter{
            $0.reservationState == 0
        }
        recentData = waitldata

        self.waitldata = waitldata
        let confilmedldata = data.filter{
            $0.reservationState == 1 || $0.reservationState == 2 || $0.reservationState == 3
        }
        self.confilmedldata = confilmedldata
        completion(true)
    }
    func updateRervation(id:String,isReserve:Bool) async {
        let dataBase = Firestore.firestore().collection("Reservation")
        do {
            //TODO: 여기 값만 넣어주기
            try await dataBase
                .document(id)
                .updateData([
                    "reservationState": isReserve ? 1 : 4
                ])
            
            await fetchData { success in
                if success {
                    self.isLoading = true
                }
            }
            
        } catch{
            debugPrint("updateData error")
            
        }
    }
}




struct SellerReservation: Identifiable,Codable {
    let id: String //= UUID().uuidString
    let userEmail: String
    let roomID: String
    
    let reservationYear: String
    let reservationMonth: String
    let reservationDay: String
    
    var reservationDateString: String {
        return "\(reservationYear)-\(reservationMonth)-\(reservationDay)"
    }
    
    let checkInYear: String
    let checkInMonth: String
    let checkInDay: String
    
    public var checkInDateString: String {
        return "\(checkInYear)/\(checkInMonth)/\(checkInDay)"
    }
    
    let checkOutYear: String
    let checkOutMonth: String
    let checkOutDay: String
    
    public var checkOutDateString: String {
        return "\(checkOutYear)/\(checkOutMonth)/\(checkOutDay)"
    }
    
    let placeID : String
    let hour: Int
    let personnel: Int
    
    let reservationName: String
    let reservationPhoneNumber: String
    let reservationRequest: String
    let reservationState: Int
    
    
    var calcDate : String? {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let targetDate = dateFormatter.date(from: reservationDateString) ?? Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day], from:targetDate , to: today)
        
        // 차이를 출력합니다.
        if let days = dateComponents.day {
            if days == 0{
                return "오늘"
            }
            return "\(days)일 전"
        } else {
            return nil
        }
    }
    enum CodingKeys: CodingKey {
        case id
        case userEmail
        case roomID
        case reservationYear
        case reservationMonth
        case reservationDay
        case checkInYear
        case checkInMonth
        case checkInDay
        case checkOutYear
        case checkOutMonth
        case checkOutDay
        case placeID
        case hour
        case personnel
        case reservationName
        case reservationPhoneNumber
        case reservationRequest
        case reservationState
    }
    
}

public enum ReservationHistoryType: String , CaseIterable {
    case all = "전체 내역"
    case expect = "예정 내역"
    case success = "완료 내역"
    case cancel = "취소 내역"
}
