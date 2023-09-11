//
//  DayOfMonthView.swift
//  MultiDatePickerApp
//
//  Created by Peter Ent on 11/2/20.
//

import SwiftUI

struct MDPDayView: View {
    @EnvironmentObject var monthDataModel: MDPModel
    let cellSize: CGFloat = 25
    var dayOfMonth: MDPDayOfMonth
    
    // outline "today"
    private var strokeColor: Color {
        dayOfMonth.isToday ? .myBrown : Color.clear
    }
    
    // filled if selected
    private var fillColor: Color {
        monthDataModel.isSelected(dayOfMonth) ? .myMint.opacity(0.55) : Color.clear
    }
    
    // reverse color for selections or gray if not selectable
    private var textColor: Color {
        if dayOfMonth.isSelectable {
            return monthDataModel.isSelected(dayOfMonth) ? Color.white : Color.black
        } else {
            return .myLightGray
        }
    }
    
    private func handleSelection() {
        if dayOfMonth.isSelectable {
            monthDataModel.selectDay(dayOfMonth)
        }
    }
    
    var body: some View {
        Button( action: {handleSelection()} ) {
            Text("\(dayOfMonth.day)")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(textColor)
                .frame(minHeight: cellSize, maxHeight: cellSize)
                .background(
                    Circle()
                        .stroke(strokeColor, lineWidth: 1)
                        .background(Circle().foregroundColor(fillColor))
                        .frame(width: cellSize, height: cellSize)
                )
        }
        .foregroundColor(.black)
    }
}

struct DayOfMonthView_Previews: PreviewProvider {
    static var previews: some View {
        MDPDayView(dayOfMonth: MDPDayOfMonth(index: 0, day: 1, date: Date(), isSelectable: true, isToday: false))
            .environmentObject(MDPModel())
    }
}
