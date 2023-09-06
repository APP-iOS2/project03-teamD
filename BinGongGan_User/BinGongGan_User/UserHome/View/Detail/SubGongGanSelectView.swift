//
//  SubGongGanSelectView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI

struct SubGongGanSelectView: View {
    @EnvironmentObject var gongGan: GongGanStore
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                gongGan.customSection("세부공간 선택")
                ForEach($gongGan.gongGanStore.detailGongGan) { $space in
                    Button {
                        if space.isSelected == true {
                            space.isSelected = false
                        } else {
                            for index in 0..<gongGan.gongGanStore.detailGongGan.count {
                                gongGan.gongGanStore.detailGongGan[index].isSelected = false
                            } // 하나의 버튼만 클릭 이미지 표시
                            space.isSelected.toggle()
                        }
                        
                    } label: {
                        VStack(alignment: .leading) {
                            Label(space.title, systemImage: space.isSelected ? "circlebadge.fill" : "circlebadge")
                                .foregroundColor(.black)
                            if space.isSelected {
                                SubGongGanDetailView()
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(3)
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
