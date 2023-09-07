//
//  EnquiryView.swift
//  BinGongGan_User
//
//  Created by 방유빈 on 2023/09/06.
//

import SwiftUI

struct EnquiryView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle.fill")
            Text("공사중~")
        }
        .foregroundColor(.myPrimary)
        .font(.largeTitle)
        .navigationTitle("1 : 1 문의")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myPrimary)
                }
            }
        }
    }
}

struct EnquiryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnquiryView()
        }
    }
}
