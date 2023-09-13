//
//  AddPhotoView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/11.
//

import SwiftUI
import UIKit

// MARK: - 카메라 접근 필요
struct MultiPhotoPickerView: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MultiPhotoPickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MultiPhotoPickerView>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: MultiPhotoPickerView
        
        init(_ parent: MultiPhotoPickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImages.append(selectedImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddPhotoView: View {
    @Binding var selectedImages: [UIImage]
    @State var isShowingPhotoPicker: Bool = false
    @State var isShowingToast: Bool = false
    
    var body: some View {
        ScrollViewReader { proxy in
            HStack{
                Button {
                    //TODO: - 이미지 파베 저장 로직 추가
                    if selectedImages.count < 5 {
                        isShowingPhotoPicker.toggle()
                    }
                    else {
                        isShowingToast.toggle()
                    }
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.myBrown)
                        Text("+")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }// Button
                .buttonStyle(.plain)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(selectedImages.indices, id:\.self) { index in
                            Image(uiImage: selectedImages[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .cornerRadius(15)
                                .overlay(alignment: .topTrailing) {
                                    Button {
                                        selectedImages.remove(at: index)
                                    } label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .font(.head1Bold)
                                            .foregroundColor(.white)
                                            .offset(x: -4, y: 4)
                                    }
                                }
                        }
                    }
                }// ScrollView
                .onChange(of: selectedImages.count) { _ in
                    // 메시지 목록이 변경되면 스크롤을 아래로 이동
                    withAnimation {
                        proxy.scrollTo(selectedImages.count - 1, anchor: .center)
                    }
                }
            }// HStack
        }// ScrollViewReder
        .sheet(isPresented: $isShowingPhotoPicker) {
            MultiPhotoPickerView(selectedImages: $selectedImages)
        }
        .toast(isShowing: $isShowingToast, message: "이미지는 최대 5개까지 가능합니다.")
    }
}

struct AddPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhotoView(selectedImages: .constant([]))
    }
}
