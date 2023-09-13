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
    @Binding var isReservationActive: Int?
    @State var selectedSpaceIndex: Int? = nil
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Group {
                VStack(alignment: .leading, spacing: 10) {
                    Text(gongGan.gongGanInfo.placeName)
                        .font(.title2)
                    Text(gongGan.gongGanInfo.placeLocation)
                        .foregroundColor(Color.myDarkGray)
                }
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            
            
            
            Divider()
            
            Group {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.myLightGray)
                        .opacity(0.5)
                        .frame(width: screenWidth * 0.95, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.clear, lineWidth: 1)
                                .overlay(
                                    Label("본 매장은 결제 후 승인시 확정 됩니다.", systemImage: "info.circle")
                                        .font(.subheadline)
                                        .foregroundColor(.myMediumGray)
                                )
                        )
                    Spacer()
                }
            }
            .padding(.vertical, 10)
            
            Rectangle()
                .fill(Color.myLightGray)
                .frame(height: 5)
            
            Group {
//            customSection("세부공간 선택")
                HStack {
                    Text("세부공간 선택")
                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
            
                VStack(alignment: .center) {
                    ForEach(gongGan.gongGanInfo.detailGongGan.indices, id: \.self) { index in
                        let space = gongGan.gongGanInfo.detailGongGan[index]
                        Button {
                            if selectedSpaceIndex == index {
                                selectedSpaceIndex = nil
                                isReservationActive = nil
                            } else {
                                selectedSpaceIndex = index
                                isReservationActive = index
                            }
                        } label: {
                            VStack {
                                HStack(alignment: .center) {
                                    Text(" ● ")
                                    Text("\(space.title)")
                                    Spacer()
                                    Text("\(space.price) / 시간")
                                }
                                    .font(.body1Regular)
                                    .foregroundColor(selectedSpaceIndex == index ? .white : .myBrown)
                                    .frame(width: screenWidth * 0.85)
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(selectedSpaceIndex == index ? .myBrown : .white)
                                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                    )
                                
                                
                            }
                        }
                        .buttonStyle(.plain)
                        if selectedSpaceIndex == index {
                            VStack {
                                SubGongGanDetailView(gongGan: space)
                                    .transition(.offset(.zero))
                                .padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            
                .frame(width: screenWidth * 0.95)
        }
        .background(Color.myBackground)
    }
}


struct SubGongGanSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanSelectView(isReservationActive: .constant(nil))
            .environmentObject(GongGanStore())
    }
}
