//
//  MonthView.swift
//  MultiDatePickerApp
//
//  Created by Peter Ent on 11/2/20.
//

import SwiftUI

struct MDPMonthView: View {
    @EnvironmentObject var monthDataModel: MDPModel
        
    @State private var showMonthYearPicker = false
    @State private var testDate = Date()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private func showPrevMonth() {
        withAnimation {
            monthDataModel.decrMonth()
            showMonthYearPicker = false
        }
    }
    
    private func showNextMonth() {
        withAnimation {
            monthDataModel.incrMonth()
            showMonthYearPicker = false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                MDPMonthYearPickerButton(isPresented: self.$showMonthYearPicker)
                
                Spacer()
                
                Button( action: {showPrevMonth()} ) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myBrown)
                        .font(.title2)
                }.padding()
                
                Button( action: {showNextMonth()} ) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.myBrown)
                        .font(.title2)
                }.padding()
            }
            .padding(.leading, 20)
            
            GeometryReader { reader in
                if showMonthYearPicker {
                    MDPMonthYearPicker(date: monthDataModel.controlDate) { (month, year) in
                        self.monthDataModel.show(month: month, year: year)
                    }
                }
                else {
                    MDPContentView()
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.myBrown, lineWidth: 1)
        )
        .padding()
        .frame(width: screenWidth, height: 300)
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MDPMonthView()
            .environmentObject(MDPModel())
    }
}
