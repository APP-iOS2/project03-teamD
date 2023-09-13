//
//  EasterEggAlert.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/12.
//

import SwiftUI

struct EasterEggModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    let title: String
    let primaryButtonTitle: String
    let primaryAction: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            ZStack {
                if isPresented {
                    Rectangle()
                        .fill(.black.opacity(0.5))
                        .blur(radius: isPresented ? 2 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.isPresented = false // 외부 영역 터치 시 내려감
                        }
                    
                    EasterEggAlert(
                        isPresented: self.$isPresented,
                        title: self.title,
                        primaryButtonTitle: self.primaryButtonTitle,
                        primaryAction: self.primaryAction
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(
                isPresented
                ? .spring(response: 0.3)
                : .none,
                value: isPresented
            )
        }
    }
}

struct EasterEggAlert: View {
    @EnvironmentObject var homeStore: HomeStore
    @Binding var isPresented: Bool
    let title: String
    let primaryButtonTitle: String
    let primaryAction: () -> Void
    var body: some View {
        VStack(spacing: 22) {
            
            Image("\(homeStore.mungImage[homeStore.mungImageCount])")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.black)
            
            Divider()
            Button {
                primaryAction()
                isPresented = false
            } label: {
                Text(primaryButtonTitle)
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 18)
        .frame(width: 300)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.blue.opacity(0.5))
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                )
        )
    }
}

