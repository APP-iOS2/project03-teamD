//
//  AppInformationView.swift
//  BinGongGan_User
//
//  Created by 민근의 mac on 2023/09/10.
//

import SwiftUI

struct AppInfomationView: View {
    
    private let markdownFileName = "Information1"
    private var text: String {
        get {
            if let markdownFilePath = Bundle.main.path(forResource: markdownFileName, ofType: "md") {
                do {
                    let markdownText = try String(contentsOfFile: markdownFilePath, encoding: .utf8)
                    
                    return markdownText
                } catch {
                    return "Markdown 파일을 읽을 수 없습니다. 오류: \(error)"
                }
            } else {
                return "Markdown 파일을 찾을 수 없습니다."
            }
        }
    }
    var body: some View {
        ScrollView {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct AppInfomationView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfomationView()
    }
}
