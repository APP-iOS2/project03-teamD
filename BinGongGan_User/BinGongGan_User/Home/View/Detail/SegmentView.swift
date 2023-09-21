//
//  SegmentView.swift
//  BinGongGan_User
//
//  Created by 임대진 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct SegmentView: View {
    @Binding var selectedSegment: GongGanDetailView.segmentIndex
    @Binding var isReservationActive: Int?
    @Binding var roomId: String
    @Binding var placeId: String
    let animation: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                ForEach(GongGanDetailView.segmentIndex.allCases, id: \.self) { segment in
                    VStack {
                        Text(segment.rawValue)
                            .font(.subheadline)
                        
                        if selectedSegment == segment {
                            Rectangle()
                                .foregroundColor(.myBrown)
                                .frame(maxWidth: UIScreen.screenWidth * 0.45, maxHeight: 2)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(maxWidth: UIScreen.screenWidth * 0.45, maxHeight: 2)
                        }
                    }
                    .frame(height: 50)
                    .onTapGesture {
                        withAnimation {
                            selectedSegment = segment
                        }
                        
                        if selectedSegment != .info {
                            isReservationActive = nil
                        }
                    }
                }
            }
            switch selectedSegment {
            case .info:
                DetailInfoView(isReservationActive: $isReservationActive,roomId: $roomId)
            case .review:
                DetailSegmentReviewListView(placeId: placeId)
            case .event:
                DetailAnnouncementView()
            }
        }
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(selectedSegment: .constant(.info), isReservationActive: .constant(nil), roomId: .constant(""), placeId: .constant(""), animation: Namespace().wrappedValue)
            .environmentObject(GongGanStore())
    }
}

