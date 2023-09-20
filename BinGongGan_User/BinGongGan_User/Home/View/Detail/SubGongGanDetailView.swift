//
//  SubGongGanDetailView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/06.
//

import SwiftUI
import BinGongGanCore

struct SubGongGanDetailView: View {
    @State var gongGan: DetailGongGan
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                DetailTabImageView(imageUrl: $gongGan.detailImageUrl)
                    .frame(height: UIScreen.screenHeight * 0.25)
                
                VStack(alignment: .leading) {
                    customSection("공간 소개")
                    Text(gongGan.info)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.subheadline)
                        .foregroundColor(.myDarkGray)
                        .padding(.bottom, 5)
                    VStack(alignment: .leading, spacing: 10) {
                        customSection("공간 정보")
                        
                        Group {
                            HStack {
                                Text(" ◦ 공간유형  :")
                                Text(gongGan.categoryName)
                            }
                            HStack {
                                Text(" ◦ 예약시간  :")
                                Text(gongGan.MinimumReservationTimeInfo)
                            }
                            HStack {
                                Text(" ◦ 수용인원  :")
                                Text(gongGan.capacity)
                            }
                            Divider()
                        }
                        .font(.subheadline)
                        .foregroundColor(.myDarkGray)
                    }
                    .foregroundColor(.black)
                }
                .font(.body1Regular)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 1, trailing: 0))
            }
        }
    }
}

struct SubGongGanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanDetailView(gongGan: DetailGongGan.sample)
    }
}
