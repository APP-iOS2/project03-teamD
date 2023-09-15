//
//  AddAnnouncementView.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import SwiftUI
import BinGongGanCore

struct AddAnnouncementView: View {
    enum AlertType {
        case cancel
        case submit
    }
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var announcementStore: AnnouncementStore
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedType: AnnouncementType = .notice
    @State private var isShowingAlert: Bool = false
    @State private var alertType: AlertType = .cancel
    
    
    var body: some View {
        Form {
            Section("공지 타입") {
                Picker("공지 타입 선택", selection: $selectedType) {
                    ForEach(AnnouncementType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.menu)
            }
            Section("제목") {
                CustomTextField(placeholder: "공지 제목을 입력하세요.", text: $title)
            }
            Section("공지 내용") {
                ZStack(alignment: .topLeading) {
                    if content.isEmpty {
                        Text("공지 내용을 작성해주세요.")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 4))
                    }
                    TextEditor(text: $content)
                        .frame(height: UIScreen.main.bounds.height * 0.3)
                }
            }
            
            Section {
                HStack{
                    Button{
                        alertType = .cancel
                        isShowingAlert.toggle()
                    } label: {
                        Text("작성 취소")
                            .buttonStyle(backgroundColor: .myLightGray)
                    }
                    Button{
                        alertType = .submit
                        isShowingAlert.toggle()
                    } label: {
                        Text("작성 완료")
                            .buttonStyle(backgroundColor: .myBrown)
                    }

                }
                .font(.head1Bold)
                .buttonStyle(.plain)
            }
            .listRowBackground(Color.myBackground )
        }
        .tint(.myMint)
        .navigationTitle("공지 작성")
        .scrollContentBackground(.hidden)
        .background(Color.myBackground, ignoresSafeAreaEdges: .all)
        .onTapGesture {
            self.endTextEditing()
        }
        .alert("공지 작성", isPresented: $isShowingAlert) {
            Button {

            } label: {
                Text("취소") //MARK: - 작성 취소 시 취소 / 작성 취소 먼가 레이블링 겹침 수정 필요
            }
            Button {
                switch alertType {
                case .cancel :
                    dismiss()
                case .submit :
                    Task {
                        try await announcementStore.addAnnouncement(title: title, content: content, type: selectedType)
                    }
                }
                dismiss()
            } label: {
                Text((alertType == .cancel) ? "작성 취소" : "공지 저장")
            }

        } message: {
            let alertText = (alertType == .cancel) ? "공지 작성을 취소합니다. 취소하면 작성한 공지가 삭제됩니다." : "작성한 공지를 저장하시겠습니까?"
            Text(alertText)
        }

    }
}

struct AddAnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddAnnouncementView(announcementStore: AnnouncementStore())
        }
    }
}
