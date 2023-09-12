//
//  SwiftUIView.swift
//  
//
//  Created by 마경미 on 12.09.23.
//

import SwiftUI

public struct MintButton: View {
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
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .foregroundColor(.white)
                .background(Color.myMint)
                .clipShape(Capsule())
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        MintButton(action: {
            
        }, title: "버튼")
    }
}
