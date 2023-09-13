import SwiftUI
import Photos
import UIKit
import BinGongGanCore

struct PhotoSelectedView: View {
    @Binding var selectedImages: [UIImage]
    @Binding  var selectedImageNames: [String]
    @State private var isImagePickerPresented = false
    @State private var isGalleryPermissionGranted = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    if selectedImages.count < 5 {
                        Button {
                            requestGalleryPermission()
                            if isGalleryPermissionGranted {
                                isImagePickerPresented.toggle()
                            }
                            
                        } label: {
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(25)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.myLightGray, lineWidth: 1)
                                }
                            
                        }
                        
                    }
                    ForEach(selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 70, height: 70)
                            .padding(.leading, 5)
                            .aspectRatio(contentMode: .fill)
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    guard let index = selectedImages.firstIndex(where: {
                                        $0 == image
                                    }) else {
                                        return
                                    }
                                    selectedImages.remove(at: index)
                                    selectedImageNames.remove(at: index)
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .foregroundColor(.black)
                                }
                            }
                    }
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                MultiPhotoPickerView(selectedImages: $selectedImages, selectedImageNames: $selectedImageNames)
            }
        }
        .padding()
    }
    
    func requestGalleryPermission() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                if status == .authorized {
                    isGalleryPermissionGranted = true
                } else {
                    isGalleryPermissionGranted = false
                }
            }
        }
    }
    
}

struct MultiPhotoPickerView: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    @Binding var selectedImageNames: [String]
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
            if let imageURL = info[.imageURL] as? URL
            {
                let selectedImageNames = imageURL.lastPathComponent
                parent.selectedImageNames.append(selectedImageNames)
            }
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

struct PhotoSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectedView(selectedImages: .constant([]), selectedImageNames: .constant([""]))
    }
}
