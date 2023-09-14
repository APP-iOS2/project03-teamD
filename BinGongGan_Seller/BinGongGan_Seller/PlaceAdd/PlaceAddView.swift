//  PlaceAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/05.
//

import SwiftUI
import MapKit
import BinGongGanCore
import FirebaseFirestore

struct PlaceAddView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var placeStore: PlaceStore = PlaceStore()
    @State private var selectedPlace: PlaceCategory = .share
    @State private var placeInfomations = PlaceInfomationModel.data
    @State private var address: Address?
    @State private var coordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @State private var placeNameText: String = ""
    @State private var selectedImage: [UIImage] = []
    @State private var selectedImageNames: [String] = []
    @State private var noteText: String = ""
    @State private var placeNotes: [String] = []
    @State private var isShwoingSearchSheet: Bool = false
    @State private var placeNoteText: String = ""
    @State private var isShowingToast:Bool = false
    @State private var toastMessage: String = ""
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    private var placeInfomationString: [String] {
        placeInfomations.filter {
            $0.isSelected
        }.map {
            $0.name
        }
    }
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text("공간 이름")
                            .font(.body1Bold)
                        CustomTextField(maxLength: 20, placeholder: "공간 이름을 입력하세요", text: $placeNameText)
                    }
                    
                    Group {
                        Text("공간 카테고리")
                            .font(.body1Bold)
                        Picker("공간 카테고리", selection: $selectedPlace) {
                            ForEach(PlaceCategory.allCases) { category in
                                Text(category.placeCategoryName)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .labelsHidden()
                        .tint(.black)
                    }
                    .padding(.top, 15)
                    
                    Group {
                        Text("공간 주소")
                            .font(.body1Bold)
                        Button {
                            isShwoingSearchSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text("주소검색")
                                    .font(.body1Bold)
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        if !(address == nil) {
                            VStack(alignment: .leading) {
                                Text("\(address?.placeName ?? "상호명")")
                                Text("\(address?.address ?? "주소")")
                            }
                            MapView(coordinates: coordinates)
                                .frame(height: 300)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, 15)
                    
                    Group {
                        Text("공간 사진 등록 (최소 1장 필수)")
                            .font(.body1Bold)
                        PhotoSelectedView(selectedImages: $selectedImage,selectedImageNames: $selectedImageNames)
                    }
                    .padding(.top, 15)
                    
                    Group {
                        Text("공간 시설 선택")
                            .font(.body1Bold)
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach($placeInfomations) { $infomation in
                                PlaceInfomationButtonView(infomation: $infomation)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .frame(maxHeight: .infinity)
                    }
                    .padding(.top, 15)
                    
                    Group {
                        HStack {
                            Text("공간 정보")
                                .font(.body1Bold)
                            Spacer()
                        }
                        HStack {
                            if placeNotes.count < 5 {
                                TextField("정보를 입력하세요", text: $placeNoteText)
                                    .textFieldStyle(.roundedBorder)
                                
                                Button {
                                    if !(placeNoteText.isEmpty) {
                                        withAnimation {
                                            placeNotes.append(placeNoteText)
                                            placeNoteText = ""
                                        }
                                    } else {
                                        toastMessage = "정보를 입력하세요"
                                        isShowingToast = true
                                    }
                                } label: {
                                    Image(systemName: "plus.app.fill")
                                        .foregroundColor(Color.myMint)
                                }
                            }
                        }
                        
                        ForEach(Array(zip(placeNotes,placeNotes.indices)), id:\.1) { note, index in
                            HStack {
                                Text(note)
                                Spacer()
                                Button {
                                    withAnimation {
                                        if note == placeNotes[index] {
                                            placeNotes.remove(at: index)
                                        }
                                    }
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .padding(.top, 15)
                    
                    Group {
                        AbledPrimaryButton(title: "등록하기") {
                            if let address, !placeNameText.isEmpty, !selectedImageNames.isEmpty {
                                let place = Place(
                                    sellerId: AuthStore.userUid,
                                    placeName: placeNameText,
                                    placeCategory: selectedPlace,
                                    placeImageStringList: selectedImageNames,
                                    note: placeNotes,
                                    placeInfomationList: placeInfomationString,
                                    address: address
                                )
                                Task{
                                    await placeStore.addPlace(place: place, images: selectedImage)
                                    
                                }
                                toastMessage = "등록 완료!!"
                                isShowingToast = true
                                dismiss()
                            } else {
                                toastMessage = "빈칸을 모두 입력해주세요"
                                isShowingToast = true
                            }
                        }
                    }
                    .padding(.top, 15)
                }
                .padding(20)
                .toast(isShowing: $isShowingToast, message: toastMessage)
                .sheet(isPresented: $isShwoingSearchSheet, onDismiss: {
                    if let address {
                        coordinates =  CLLocationCoordinate2D(latitude: address.latitudeDouble, longitude: address.longitudeDouble)
                    }
                }, content: {
                    NavigationStack {
                        AddressSearchView(isShwoingSearchSheet: $isShwoingSearchSheet) { newAdress in
                            address = newAdress
                        }
                    }
                })
            }
        }
        .customBackbutton()
    }
}

struct PlaceAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaceAddView()
                .environmentObject(PlaceStore())
        }
    }
}
