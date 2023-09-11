//
//  RoomAddView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore
import Combine

struct RoomAddView: View {
    @State private var roomName: String = ""
    @State private var roomNote: String = ""
    @State private var roomPrice: String = ""
    @State private var placePriceText: String = ""
    @State private var selectedImage: [UIImage] = []
    @State private var selectedImageNames: [String] = []
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Group{
                        Text("방이름")
                        CustomTextField(placeholder: "방이름을 입력하세요", text: $roomName)
                    }
                    
                    Group {
                        Text("공간 대여 가격")
                            .font(.body1Bold)
                        
                        HStack(spacing: 0) {
                            Text("시간 당")
                                .padding(.trailing, 5)
                                .foregroundColor(Color.myDarkGray)
                            TextField("가격을 입력하세요", text: $placePriceText)
                            
                                .keyboardType(.decimalPad)
                            
                                .onReceive(Just(placePriceText)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.placePriceText = filtered
                                    }
                                }
                                .onChange(of: placePriceText) { newValue in
                                    if let formattedNumber = formatNumberString(newValue) {
                                        placePriceText = formattedNumber
                                    }
                                }
                                .overlay(alignment:.trailing) {
                                    Text("￦")
                                        .padding(.trailing, 1)
                                }
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    }
                    .padding(.top, 15)
                    
                    Section {
                        Text("방 상세사진")
                        PhotoSelectedView(selectedImages: $selectedImage, selectedImageNames: $selectedImageNames)
                    }
                    
                    
                    Section{
                        Text("방 상세내용")
                        TextEditor(text: $roomNote)
                            .font(.body1Regular)
                            .frame(height: 300)
                            .cornerRadius(10)
                    }
                    
                    PrimaryButton(title: "등록 하기") {
                        
                    }
                }
            }
            .padding(20)
        }
      
        .navigationTitle("방 추가")
    }
    
    func formatNumberString(_ input: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.usesGroupingSeparator = true
        
        if let number = formatter.number(from: input) {
            return formatter.string(from: number)
        } else {
            return nil
        }
    }
    
}

struct RoomAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RoomAddView()
        }
    }
}
