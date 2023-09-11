//
//  AnnouncementShareSheet.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/11.
//

import UIKit
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    let text: String
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}
