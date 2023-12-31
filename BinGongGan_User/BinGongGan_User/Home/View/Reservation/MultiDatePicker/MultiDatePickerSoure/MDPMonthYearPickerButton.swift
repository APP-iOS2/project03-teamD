//
//  MonthYearPickerButton.swift
//  MultiDatePickerApp
//
//  Created by Peter Ent on 11/3/20.
//

import SwiftUI

struct MDPMonthYearPickerButton: View {
    @EnvironmentObject var monthDataModel: MDPModel
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Button {
            //withAnimation { isPresented.toggle() }
            
        } label: {
            HStack {
                Text(monthDataModel.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(self.isPresented ? .myBrown : .myDarkGray)
                /*
                Image(systemName: "chevron.right")
                    .foregroundColor(self.isPresented ? .myBrown : .myDarkGray)
                    .rotationEffect(self.isPresented ? .degrees(90) : .degrees(0))
                 */
            }
        }
    }
}

struct MonthYearPickerButton_Previews: PreviewProvider {
    static var previews: some View {
        MDPMonthYearPickerButton(isPresented: .constant(false))
    }
}
