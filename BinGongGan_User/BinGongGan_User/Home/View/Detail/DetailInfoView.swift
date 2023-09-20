//
//  SegmentInfoView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct DetailInfoView: View {
    @EnvironmentObject var gongGan: GongGanStore
    @Binding var isReservationActive: Int?
    @Binding var roomId: String
    
    var body: some View {
        NavigationStack {
            Group {
                SubGongGanSelectView(isReservationActive: $isReservationActive, roomId: $roomId)
            }
            
            
            VStack(alignment: .center,spacing: 20) {
                
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
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    HStack(spacing: 10) {
                        ForEach(gongGan.gongGanInfo.placeGuide.indices, id: \.self) { index in
                            if index < 4 {
                                VStack {
                                    VStack {
                                        Image(systemName: gongGan.gongGanInfo.placeGuide[index].systemImage)
                                            .font(.system(size: 40))
                                            .frame(width: 80, height: 40)
                                    }
                                    Text(gongGan.gongGanInfo.placeGuide[index].labelTitle)
                                        .frame(width: 80)
                                }
                            }
                        }
                        .foregroundColor(Color.myBrown)
                        Spacer()
                    }
                    .padding(.leading, 5)
                    HStack(spacing: 10) {
                        ForEach(gongGan.gongGanInfo.placeGuide.indices, id: \.self) { index in
                            if index > 3 {
                                VStack {
                                    VStack {
                                        Image(systemName: gongGan.gongGanInfo.placeGuide[index].systemImage)
                                            .font(.system(size: 40))
                                    }
                                    .frame(width: 80, height: 40)
                                    Text(gongGan.gongGanInfo.placeGuide[index].labelTitle)
                                        .frame(width: 80)
                                }
                            }
                        }
                        .foregroundColor(Color.myBrown)
                        Spacer()
                    }
                    .padding(.leading, 5)
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 20, trailing: 0))
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 90)
        }
    }
}

struct DetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInfoView(isReservationActive: .constant(nil), roomId: .constant(""))
            .environmentObject(GongGanStore())
    }
}
