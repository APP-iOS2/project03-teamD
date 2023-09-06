//
//  MonthContentView.swift
//  MultiDatePickerApp
//
//  Created by Peter Ent on 11/3/20.
//

import SwiftUI

struct MDPContentView: View {
    @EnvironmentObject var monthDataModel: MDPModel
    
    let cellSize: CGFloat = 30
    
    let columns = [
        GridItem(.fixed(30), spacing: 15),
        GridItem(.fixed(30), spacing: 15),
        GridItem(.fixed(30), spacing: 15),
        GridItem(.fixed(30), spacing: 15),
        GridItem(.fixed(30), spacing: 15),
        GridItem(.fixed(30), spacing: 15),
        GridItem(.fixed(30), spacing: 15)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            
            // Sun, Mon, etc.
            ForEach(0..<monthDataModel.dayNames.count, id: \.self) { index in
                Text(monthDataModel.dayNames[index].uppercased())
                    .font(.caption)
                    .foregroundColor(.myDarkGray)
            }
            .padding(.bottom, 20)
            
            // The actual days of the month.
            ForEach(0..<monthDataModel.days.count, id: \.self) { index in
                if monthDataModel.days[index].day == 0 {
                    Text("")
                        .frame(minHeight: cellSize, maxHeight: cellSize)
                } else {
                    MDPDayView(dayOfMonth: monthDataModel.days[index])
                        .padding([.top,.bottom],3)
                }
            }
        }.padding(.bottom, 20)
    }
}

struct MonthContentView_Previews: PreviewProvider {
    static var previews: some View {
        MDPContentView()
    }
}
