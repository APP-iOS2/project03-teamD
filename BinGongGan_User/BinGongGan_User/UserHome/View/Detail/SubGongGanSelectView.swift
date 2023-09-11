//
//  SubGongGanSelectView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct SubGongGanSelectView: View {
    @State var gongGan: GongGan
    private let scrennWidth = UIScreen.main.bounds.width
    @State var selectedSpaceIndex: Int? = nil
    
    var body: some View {
        VStack {
            customSection("세부공간 선택")
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
            
            VStack(alignment: .center) {
                ForEach(gongGan.detailGongGan.indices, id: \.self) { index in
                    let space = gongGan.detailGongGan[index]
                    Button {
                        if selectedSpaceIndex == index {
                            selectedSpaceIndex = nil
                        } else {
                            selectedSpaceIndex = index
                        }
                    } label: {
                        VStack {
                            HStack(alignment: .center) {
                                Text("\(space.title)")
                                    .font(.body1Regular)
                                    .foregroundColor(selectedSpaceIndex == index ? .white : .myPrimary)
                                    .frame(width: scrennWidth * 0.85)
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(selectedSpaceIndex == index ? .myPrimary : .white)
                                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                    )
                            }
                            
                            if selectedSpaceIndex == index {
                                SubGongGanDetailView(gongGan: space)
                                    .transition(.offset(.zero))
                                    .padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    
                }
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
        }
        .background(Color.myBackground)
    }
}


struct SubGongGanSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanSelectView(gongGan: GongGan.sampleGongGan)
    }
}
