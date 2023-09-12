//
//  PirmaryButton.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

public struct PrimaryButton: View {
    var action: () -> Void
    var title: String
    
    public init(action: @escaping () -> Void, title: String) {
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
                .background(Color.myBrown)
                .cornerRadius(8)
        }
    }
}

struct PirmaryButton_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        PrimaryButton(action: {
            
        }, title: "다음")
    }
}
