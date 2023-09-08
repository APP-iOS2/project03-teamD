//
//  SubGongGanSelectView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct SubGongGanSelectView: View {
    @EnvironmentObject var gongGan: GongGanStore
    private let scrennWidth = UIScreen.main.bounds.width
    var body: some View {
        NavigationStack {
            
            gongGan.customSection("세부공간 선택")
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
            
            VStack(alignment: .center) {
                ForEach($gongGan.gongGanStore.detailGongGan) { $space in
                    Button {
                        if space.isSelected == true {
                            space.isSelected = false
                        } else {
                            for index in 0..<gongGan.gongGanStore.detailGongGan.count {
                                gongGan.gongGanStore.detailGongGan[index].isSelected = false
                            }
                            space.isSelected.toggle()
                        }
                    } label: {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                
                                //                                    Image(systemName: "checkmark")
                                //                                        .opacity(space.isSelected ? 1 : 2)
                                //                                    .font(.captionRegular)
                                //                                        .foregroundColor(space.isSelected ? .white : .black)
                                
                                
                                Text("\(space.title)")
                                    .font(.body1Regular)
                                    .foregroundColor(space.isSelected ? .white : .myPrimary)
                                    .frame(width: scrennWidth * 0.85)
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(space.isSelected ? .myPrimary : .white)
                                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                    )
                            }
                            //                            .frame(height: 30)
                            if space.isSelected {
                                SubGongGanDetailView()
                                    .environmentObject(gongGan)
                                    .transition(.offset(.zero))
                                    .padding(.top ,1)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
                
            }
            .padding(.top, 10)
        }
    }
}

struct SubGongGanSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanSelectView()
            .environmentObject(GongGanStore())
    }
}
