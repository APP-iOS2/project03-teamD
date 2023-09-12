//
//  PirmaryButton.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PrimaryButton: View {
    @Binding var isDisabled: Bool
    var action: () -> Void
    var title: String
    
    public init(isDisabled: Binding<Bool>, action: @escaping () -> Void, title: String) {
        self._isDisabled = isDisabled
        self.action = action
        self.title = title
    }
    
    @available(iOS 13.0, *)
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.body1Bold)
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(isDisabled ? Color.myLightGray: Color.myBrown)
                .cornerRadius(8)
        }.disabled(isDisabled)
    }
}

struct PirmaryButton_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        PrimaryButton(isDisabled: .constant(false), action: {
            
        }, title: "다음")
    }
}
