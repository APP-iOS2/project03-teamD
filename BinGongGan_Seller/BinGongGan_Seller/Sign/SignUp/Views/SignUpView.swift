//
//  SignUpView.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var store: SignUpStore
    
    var body: some View {
        ZStack {
            Color.myBackground
            VStack {
                VStack {
                    Spacer(minLength: 90)
                    Text("회원가입")
                        .font(.head1Regular)
                    Spacer()
                    SignUpProgressView
                    Spacer()
                }
                .frame(maxHeight: 190)
                if store.currentStep == .first {
                    FirstStepSignUpView()
                        .environmentObject(store)
                } else if store.currentStep == .second {
                    SecondStepSignUpView()
                        .environmentObject(store)
                } else if store.currentStep == .third {
                    ThirdStepSignUpView()
                        .environmentObject(store)
                } else {
                    FourthSignUpView()
                        .environmentObject(store)
                }
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.endTextEditing()
        }
        .toast(isShowing: $store.showToast, message: store.toastMessage)
    }
    
    var SignUpProgressView: some View {
        HStack {
            Circle()
                .foregroundColor(.myMint)
                .frame(width: 12, height: 12)
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(
               
                    store.currentStep == .first ?  Color.myLightGray : Color.myMint)
            if store.currentStep == .first {
                ProgressStrokeCircleView
            } else {
                ProgressCircleView
            }
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(store.currentStep == .third || store.currentStep == .fourth  ? Color.myMint : Color.myLightGray )
            if store.currentStep == .third || store.currentStep == .fourth {
                ProgressCircleView
//                ProgressStrokeCircleView
            } else   {
                ProgressStrokeCircleView
                
            }
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(store.currentStep == .fourth ?  Color.myMint : Color.myLightGray)
            if store.currentStep == .fourth {
                ProgressCircleView
            } else {
                ProgressStrokeCircleView
            }
        }
        .frame(height: 12)
    }
    
    var ProgressCircleView: some View {
        Circle()
            .foregroundColor(.myMint)
            .frame(width: 12, height: 12)
    }
    
    var ProgressStrokeCircleView: some View {
        Circle()
            .stroke(Color.myMint, lineWidth: 1.3)
            .frame(width: 12, height: 12)
    }
    @ViewBuilder
      private func backgroundView() -> some View {
          if store.currentStep == .first {
             
              Color.blue
          } else {
              
              Color.red
          }
      }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(SignUpStore())
    }
}
