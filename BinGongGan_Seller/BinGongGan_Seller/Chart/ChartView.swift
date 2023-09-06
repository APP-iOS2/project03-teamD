//
//  ChartView.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/06.
//

import SwiftUI
import Charts



struct ChartView: View {
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
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
