//
//  SegmentInfoView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/11.
//

import SwiftUI

struct SegmentInfoView: View {
    @State var gongGan: GongGan
    private let screenWidth = UIScreen.main.bounds.width
    private let screenheight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack {
            Group {
                SubGongGanSelectView(gongGan: gongGan)
            }
            .frame(width: screenWidth * 0.95)
            
            //                Rectangle()
            //                    .fill(Color.myLightGray)
            //                    .frame(height: 5)
            
            VStack(spacing: 20) {
                
                Group {
                    VStack(alignment: .leading, spacing: 10) {
                        customSection("건물 정보")
                        ForEach(gongGan.placeInfo, id: \.self) { summary in
                            Text("◦ \(summary)")
                                .font(.subheadline)
                                .foregroundColor(.myDarkGray)
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                
                Group {
                    customSection("시설 안내")
                    HStack(spacing: 40) {
                        ForEach(gongGan.placeGuide) { label in
                            VStack {
                                Image(systemName: label.systemImage)
                                    .resizable()
                                    .frame(width: 40,height: 30)
                                
                                Text(label.text)
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 20, trailing: 0))
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 60)
        }
    }
}

struct SegmentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentInfoView(gongGan: GongGan.sampleGongGan)
    }
}
