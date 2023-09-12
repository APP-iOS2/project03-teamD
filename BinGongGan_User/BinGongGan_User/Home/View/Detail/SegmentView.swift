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
    let screenWidth: CGFloat
    let animation: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                ForEach(GongGanDetailView.segmentIndex.allCases, id: \.self) { segment in
                    VStack {
                        Text(segment.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedSegment == segment ? .bold : .regular)
                            .foregroundColor(selectedSegment == segment ? .myBrown : .black)
                        
                        if selectedSegment == segment {
                            Rectangle()
                                .foregroundColor(.myBrown)
                                .frame(maxWidth: screenWidth * 0.45, maxHeight: 2)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(maxWidth: screenWidth * 0.45, maxHeight: 2)
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
                    DetailSegmentView(isReservationActive: $isReservationActive)
                case .review:
                    DetailSegmentReviewListView()
                case .event:
                    DetailAnnouncementView()
                }
        }
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
            SegmentView(selectedSegment: .constant(.info), isReservationActive: .constant(nil), screenWidth: 375, animation: Namespace().wrappedValue)
                .environmentObject(GongGanStore())
    }
}

