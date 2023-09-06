//
//  ToastMessage.swift
//  BinGongGan_User
//
//  Created by 마경미 on 07.09.23.
//

import Foundation
import SwiftUI

struct ToastMessageModifier: ViewModifier {
    @Binding var isShowing: Bool
    var message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isShowing {
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.myErrorColor)
                            .cornerRadius(20)
                            .frame(width: 300, height: 50)
                            .transition(.scale)
                        HStack {
                            Image(systemName: "exclamationmark.circle")
                                .foregroundColor(.red)
                            Text(message)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                    }
                }.padding(.bottom, 30)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
                .zIndex(1)
            }
        }
    }
}
