//
//  SummaryPlaceView.swift
//  SampleMapKit
//
//  Created by 윤지호 on 2023/09/06.
//

import SwiftUI



struct SummaryPlaceView: View {
//    var place: Place
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.white)
            .frame(width: 320, height: 180)
            .shadow(radius: 15, y: 4)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("경미님의 코딩교실")
                                .font(.headline)
                            Text("안녕하세요")
                                .font(.footnote)
                        }
                        Spacer()
                        Image("mungmoongE")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .background(.brown)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    Text("내용 내용내용내용")
                        .padding([.leading, .trailing, .bottom])
                    Spacer()
                }
            }
    }
}

struct SummaryPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPlaceView()
    }
}
