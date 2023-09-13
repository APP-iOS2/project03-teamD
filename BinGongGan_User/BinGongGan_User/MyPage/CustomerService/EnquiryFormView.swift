//
//  EnquiryFormView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/11.
//

import SwiftUI

struct EnquiryFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email: String  = "email@email.com"
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var agreement: Bool = false
    @State private var isShowingSubmitAlert: Bool = false
    @Binding var isShowingToast: Bool
    
    var isDisable: Bool {
        if email.isEmpty || title.isEmpty || content.isEmpty || !agreement {
            return true
        } else {
            return false
        }
    }
    var body: some View {
        Form {
            Section("답변받으실 이메일") {
             CustomFormTextField(placeholder: "답변받으실 이메일을 입력해주세요.", text: $email)
            }
            Section("제목") {
             CustomFormTextField(placeholder: "제목을 입력해주세요.", text: $title)
            }
            Section("내용") {
                ZStack(alignment: .topLeading) {
                    if content.isEmpty {
                        Text("문의 내용을 작성해주세요.")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4))
                    }
                    TextEditor(text: $content)
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                }
            }
            
            AgreementCheckButton(agreement: $agreement, text: "개인정보 수집 및 이용 동의")
             .listRowBackground(Color.myBackground)
             .listRowSeparator(.hidden)
            
            Button {
                isShowingSubmitAlert.toggle()
            } label: {
                Text("보내기")
                    .font(.body1Bold)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(
             RoundedRectangle(cornerRadius: 15)
                .foregroundColor(isDisable ? .myDarkGray : .myBrown)
            )
            .disabled(isDisable)
            .buttonStyle(.plain)
            .listRowBackground(Color.myBackground)
        }
        .alert("문의 작성", isPresented: $isShowingSubmitAlert) {
            Button("취소", role: .none) {}
            Button("보내기", role: .none) {
                isShowingToast.toggle()
                dismiss()
            }
        }message: {
            Text("작성한 문의를 보냅니다.")
        }
        .onTapGesture {
        self.endTextEditing()
        }
        .navigationTitle("이메일 문의")
        .customBackbutton()
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
    }
}

struct EnquiryFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnquiryFormView(isShowingToast: .constant(false))
        }
    }
}

struct CustomFormTextField: View {
    var maxLength: Int = 100
    var backgroundColor: Color = .white
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField(placeholder, text: $text)
                    .padding(.horizontal, 5)
                    .font(.body1Regular)
                    .foregroundColor(.black)
                    .focused($isFocused)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                if isFocused {
                    HStack {
                        Spacer()
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.myBrown)
                        })
                        .buttonStyle(.plain)
                    }
                }
            }
            Divider()
                .background(Color.myBrown)
            
        }.frame(minHeight: 42, maxHeight: 52)
            .onChange(of: text, perform: { newValue in
                if newValue.count > maxLength {
                    text = String(newValue.prefix(maxLength))
                    isFocused = false
                }
            })
    }
}
