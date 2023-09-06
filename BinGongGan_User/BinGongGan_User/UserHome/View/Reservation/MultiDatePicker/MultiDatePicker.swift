//
//  MultiDatePicker.swift
//  MultiDatePickerApp
//
//  Created by Peter Ent on 11/3/20.
//

import SwiftUI

struct MultiDatePicker: View {
    
    enum DateSelectionChoices {
        case allDays
        case weekendsOnly
        case weekdaysOnly
    }
    
    @StateObject var monthModel: MDPModel
    
    init(dateRange: Binding<ClosedRange<Date>?>,
         includeDays: DateSelectionChoices = .allDays,
         minDate: Date? = nil,
         maxDate: Date? = nil
    ) {
        _monthModel = StateObject(wrappedValue: MDPModel(dateRange: dateRange, includeDays: includeDays, minDate: minDate, maxDate: maxDate))
    }
    
    var body: some View {
        MDPMonthView()
            .environmentObject(monthModel)
    }
}

struct MultiDatePicker_Previews: PreviewProvider {
    @State static var oneDay = Date()
    @State static var manyDates = [Date]()
    @State static var dateRange: ClosedRange<Date>? = nil
    
    static var previews: some View {
        ScrollView {
            VStack {
                MultiDatePicker(dateRange: $dateRange)
            }
        }
    }
}
