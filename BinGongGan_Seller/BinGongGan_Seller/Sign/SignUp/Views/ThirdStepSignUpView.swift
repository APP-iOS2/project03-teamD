//
//  ThirdStepSignUpView.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/12.
//

import SwiftUI
import BinGongGanCore

struct ThirdStepSignUpView: View {
    @EnvironmentObject var store: SignUpStore
    @State private var isShowingPhotoSheet = false
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("계좌번호")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(placeholder: "계좌번호", text: $store.signUpData.accountNumber)
            }
            
            Group {
                Text("사업자 등록번호")
                    .font(.body1Bold)
                    .frame(height: 38)
                CustomTextField(placeholder: "사업자 등록번호",text: $store.signUpData.registrationNumber)
            }
            Group {
                Text("사업자 등록증")
                    .font(.body1Bold)
                    .frame(height: 38)
                Button {
                    isShowingPhotoSheet = true
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 200)
                            .foregroundColor(Color.myLightGray)
                        if store.signUpData.registrationImage == UIImage(){
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width:40,height: 40)
                                .foregroundColor(.black)
                        } else {
                            Image(uiImage: store.signUpData.registrationImage)
                                .resizable()
                                .frame(height: 200)
                                .foregroundColor(.black)
                        }
                            
                    }
                    .cornerRadius(20)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 10))
                }
            }
            
            Spacer()
            PrimaryButton(title: "다음", action: {
                if store.isValidRegistration() {
                    withAnimation {
                        store.currentStep = .fourth
                    }
                }
            })
            Spacer()
        }.sheet(isPresented:$isShowingPhotoSheet) {
            ImagePickerView(sourceType: .photoLibrary, selectedImage: $store.signUpData.registrationImage)
        }
    }
}

struct ThirdStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdStepSignUpView()
            .environmentObject(SignUpStore())
    }
}


