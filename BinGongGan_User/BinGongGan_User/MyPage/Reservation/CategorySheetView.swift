//
//  CategorySheetView.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct CategorySheetView: View {
    
    @EnvironmentObject private var myReservationStore: MyReservationStore
    @Binding var isShowingSheet: Bool
    
    
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
                        if myReservationStore.selectedPicker == item {
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
                        myReservationStore.selectedPicker = item
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
        CategorySheetView(isShowingSheet: .constant(false))
            .environmentObject(MyReservationStore())
    }
}
