//
//  AnnouncementContentCell.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import SwiftUI

struct AnnouncementContentCell: View {
    @State var isShowingAnnouncementOptionSheet: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("이것은 제목입니다. 제목인데 제목이 길면 안되는데, 일단 길게 써보려고 해요.")
                    .fontWeight(.bold)
                Spacer()
                Button {
                    isShowingAnnouncementOptionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle(degrees: 90))

                }
                .buttonStyle(.plain)
            }
            Divider()
            Spacer()
            HStack {
                Text("작성일 : 2023. 09. 05")
            }
            .padding(.bottom, 20)
            HStack {
                Text("계절이 지나가는 하늘에는 가을로 가득 차 있습니다.\n나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다.\n가슴속에 하나둘 새겨지는 별을 이제 다 못 헤는 것은 쉬이 아침이 오는 까닭이요,\n내일 밤이 남은 까닭이요,\n아직 나의 청춘이 다하지 않은 까닭입니다.\n별 하나에 추억과\n별 하나에 사랑과\n별 하나에 쓸쓸함과\n별 하나에 동경과\n별 하나에 시와\n별 하나에 어머니, 어머니")
            }
        }
        .padding()
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(15)
        .sheet(isPresented: $isShowingAnnouncementOptionSheet) {
            AnnouncementOptionSheet()
                .presentationDetents([.height(AnnouncementOptionCell.screenHeight * 0.37)])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct AnnouncementContentCell_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementContentCell()
    }
}
