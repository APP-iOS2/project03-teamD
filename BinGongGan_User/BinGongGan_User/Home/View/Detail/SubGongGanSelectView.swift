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
    @Binding var roomId: String
    @State var selectedSpaceIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            Group {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(gongGan.gongGanInfo.placeName)
                            .font(.title2)
                        Text(gongGan.gongGanInfo.placeLocation)
                            .foregroundColor(Color.myDarkGray)
                    }
                    Spacer()
                }
            }
            .padding(EdgeInsets(top: 5, leading: 25, bottom: 0, trailing: 10))
            
            Divider()
            
            Group {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.myLightGray)
                        .opacity(0.5)
                        .frame(width: UIScreen.screenWidth * 0.95, height: 50)
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
                HStack {
                    Text("세부공간 선택")
                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                
                VStack(alignment: .center) {
                    if gongGan.gongGanInfo.detailGongGan.isEmpty {
                        Label("상품을 준비중 입니다.", systemImage: "hazardsign")
                            .foregroundColor(.red)
                        
                    } else {
                        ForEach(gongGan.gongGanInfo.detailGongGan.indices, id: \.self) { index in
                            let space = gongGan.gongGanInfo.detailGongGan[index]
                            Button {
                                if selectedSpaceIndex == index {
                                    selectedSpaceIndex = nil
                                    isReservationActive = nil
                                } else {
                                    selectedSpaceIndex = index
                                    isReservationActive = index
                                    roomId = gongGan.gongGanInfo.detailGongGan[index].id
                                }
                            } label: {
                                VStack {
                                    HStack(alignment: .center) {
                                        Text(" ● ")
                                        Text("\(space.title)")
                                        Spacer()
                                        Text("\(space.price) 원 / 시간")
                                    }
                                    .font(.body1Regular)
                                    .foregroundColor(selectedSpaceIndex == index ? .white : .myBrown)
                                    .frame(width: UIScreen.screenWidth * 0.85)
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
                    
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            
            .frame(width: UIScreen.screenWidth * 0.95)
        }
        .background(Color.myBackground)
    }
}


struct SubGongGanSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SubGongGanSelectView(isReservationActive: .constant(nil), roomId: .constant(""))
            .environmentObject(GongGanStore())
    }
}
