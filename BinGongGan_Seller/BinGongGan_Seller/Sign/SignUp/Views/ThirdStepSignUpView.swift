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
    @State var isNext: Bool = false
    
    var body: some View {
        ZStack {
            Color.myBackground
            VStack {
                VStack {
                    Spacer()
                    Text("회원가입")
                        .font(.head1Regular)
                }
                .frame(maxHeight: 150)
                VStack(alignment: .leading) {
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
                    PrimaryButton(isDisabled: .constant(false), action: {
                        if store.isValidRegistration() {
                            isNext = true
                        }
                    }, title: "다음")
                    Spacer()
                }
            }.padding(.horizontal, 20)
                .onAppear(perform: {
                    store.currentStep = .second
                })
                .customBackbutton()
                .navigationDestination(isPresented: $isNext, destination: {
                    FourthSignUpView()
                })
                .toolbar(content: {
                    ToolbarItem(content: {
                        Button(action: {
                            store.isShowingSignUp = false
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        })
                    })
                })
                .sheet(isPresented:$isShowingPhotoSheet) {
                    ImagePickerView(sourceType: .photoLibrary, selectedImage: $store.signUpData.registrationImage)
                }
        }.edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.endTextEditing()
            }
            .toast(isShowing: $store.showToast, message: store.toastMessage)
    }
}

struct ThirdStepSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ThirdStepSignUpView()
                .environmentObject(SignUpStore())
        }
    }
}


