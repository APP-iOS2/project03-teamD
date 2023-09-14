//
//  PostingDetailView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct PostingDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var postingStore: PostingStore
    @State private var isShowingAlert: Bool = false
    
    var posting: AdminPoting
    var body: some View {
        Form {
            Section("판매자 정보") {
                HStack {
                    Text("이름")
                    Spacer()
                    Text(posting.seller.name)
                }
                HStack {
                    Text("닉네임")
                    Spacer()
                    Text(posting.seller.nickname)
                }
                HStack {
                    Text("이메일")
                    Spacer()
                    Text(posting.seller.email)
                }
                HStack {
                    Text("전화번호")
                    Spacer()
                    Text(posting.seller.phoneNumber)
                }
            }
            ForEach(posting.rooms) { room in
                Section(room.name) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(room.imageNames, id: \.self) { url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .cornerRadius(15)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    HStack {
                        Text("가격")
                        Spacer()
                        Text(room.price)
                    }
                    Text(room.note)
                }
            }
            Button {
                isShowingAlert.toggle()
            } label: {
                Text("공간 삭제")
                    .buttonStyle(backgroundColor: Color.myBrown)
            }
            .listRowBackground(Color.myBackground)
        }
        .navigationTitle("\(posting.place.placeName)의 방 목록")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .alert("공간 삭제", isPresented: $isShowingAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    try await postingStore.removePosting(placeId: posting.place.id)
                }
                dismiss()
            }
        }message: {
            Text("해당 유저를 삭제합니다.")
        }
    }
}

struct PostingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PostingDetailView(postingStore: PostingStore(), posting: AdminPoting(place: Place(sellerId: "ssss", placeName: "꽁간", placeCategory: "밴드룸", placeImageStringList: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"], note: ["짱좋음", "애플펀치"], placeInfomationList: ["??", "??"], address: Address(address: "ssss", placeName: "사관 건물", longitude: "222", latitude: "222")), seller: Seller(id: "aaa", name: "seller", birthDate: "2000.01.22", phoneNumber: "01011111111", email: "email@email.com", nickname: "IWantMoney", password: "112313", bankName: "111111111", accountNumber: "1234567890", registrationNum: "", registrationImage: "국민은행"),rooms: [
                Room(placeId: "aaa", name: "1번방", price: "123", note: "ㅁㄴㅇㅁㄴㄹㅁㄴ", imageNames: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"]),
                Room(placeId: "aaa", name: "2번방", price: "1234", note: "ㅁㄴㅇㅇㅇㅁㄴㄹㅁㄴ", imageNames: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"]),
                Room(placeId: "aaa", name: "3번방", price: "123", note: "ㅁㄴㅇㅁㄴㄹㅁㄴ", imageNames: ["https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfNDYg/MDAxNjQ2MDk1MDI1OTQy.eu3BCy6F2TpqJfdvCg27njjoRgzPvmYnkpUmVtv8RJsg.BpYYh0MjOT6Gq9i1PrDf213X_mtQ9XR04IEeV4Dk6Lcg.JPEG.awawa11/IMG_9518.jpg?type=w800", "https://mblogthumb-phinf.pstatic.net/MjAyMjAzMDFfMjI5/MDAxNjQ2MDk1MDI0NzI4.CmtFon2i5s_MutSbTq2O1uKTnJyELjx9O8JgOqKXuWYg.0MJCSOGMpVwCaeHF4wgUJD_rXpMNFvjZxIdBA55Qj0Eg.JPEG.awawa11/IMG_9524.jpg?type=w800"])
            ]))
        }
    }
}
