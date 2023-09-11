//
//  ChartView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import SwiftUI
import Charts
import BinGongGanCore

struct ChartView: View {
    @Environment(\.dismiss) private var dismiss
    @State var selectedChart: ChartType = .bar
    var body: some View {
        VStack {
            Picker("차트", selection: $selectedChart) {
                Text(ChartType.bar.rawValue).tag(ChartType.bar)
                Text(ChartType.line.rawValue).tag(ChartType.line)
                
            }.pickerStyle(.segmented)
            
            if selectedChart == .bar {
                Chart {
                    ForEach(genders) { gender in
                        BarMark(
                            x: .value("Name", gender.name),
                            y: .value("Posting", gender.count)
                        )
                    }
                }
            } else {
                Chart {
                    ForEach(monthly) { month in
                        LineMark(
                            x: .value("month", month.month),
                            y: .value("Value", month.value)
                        )
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myBrown)
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
