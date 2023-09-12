//
//  SegmentInfoView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct DetailSegmentView: View {
    @EnvironmentObject var gongGan: GongGanStore
    @Binding var isReservationActive: Int?
    private let screenWidth = UIScreen.main.bounds.width
    private let screenheight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack {
            Group {
                SubGongGanSelectView(isReservationActive: $isReservationActive)
            }
            
            
            VStack(alignment: .leading,spacing: 20) {
                
                Group {
                    VStack(alignment: .leading, spacing: 10) {
                                                customSection("건물 정보")
//                        Text("건물 정보")
                        ForEach(gongGan.gongGanInfo.placeInfo, id: \.self) { summary in
                            Text("◦ \(summary)")
                                .font(.subheadline)
                                .foregroundColor(.myDarkGray)
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                
                Group {
                                        customSection("시설 안내")
//                    Text("시설 안내")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                    LazyHGrid(rows: [GridItem(.flexible(), spacing: 80), GridItem(.flexible(), spacing: 10)], spacing: 20) {
                        ForEach(gongGan.gongGanInfo.placeGuide) { item in
                            VStack {
                                VStack {
                                    Image(systemName: item.systemImage)
                                        .font(.system(size: 40))
                                }
                                .frame(height: 40)
                                Text(item.labelTitle)
                            }
                        }
                    }
                    .foregroundColor(Color.myBrown)
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 20, trailing: 0))
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 90)
        }
    }
}

struct SegmentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSegmentView(isReservationActive: .constant(nil))
            .environmentObject(GongGanStore())
    }
}
