//
//  CategorySheetView.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/11.
//

import SwiftUI

struct CategorySheetView: View {
    
    @Binding var isShowingSheet: Bool
    @Binding var selectedPicker: ReservationHistoryType
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    isShowingSheet = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("내역 선택")
                Spacer()
                Image(systemName: "xmark").foregroundColor(.white)
            }
            .padding()
            
            ForEach(ReservationHistoryType.allCases , id: \.self) { item in
                VStack {
                    HStack {
                        if selectedPicker == item {
                            Text(item.rawValue)
                                .foregroundColor(.myBrown).bold()
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.myMint).bold()
                        } else {
                            Text(item.rawValue)
                                .foregroundColor(.myBrown).bold()
                            Spacer()
                        }
                    }
                    .padding()
                    
                }
                .background(.white)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                        isShowingSheet = false
                    }
                }
            }
        }
        .presentationDetents([.height(UIScreen.main.bounds.height * 0.35)])
    }
}

struct CategorySheetView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySheetView(isShowingSheet: .constant(false), selectedPicker: .constant(.all))
    }
}
