//
//  MyInfoEditView.swift
//  BinGongGan_Seller
//
//  Created by 윤경환 on 2023/09/08.
//

import SwiftUI

struct MyInfoEditView: View {
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var accountNumber: String = ""
    @State var companyNumber: String = ""
    @StateObject var myInfo: MyStore

    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("이름")
                TextField("", text: $name)
                
            }
            
            VStack(alignment: .leading) {
                Text("연락처")
                TextField("", text: $phoneNumber)
            }
            
            VStack(alignment: .leading) {
                Text("계좌번호")
                TextField("", text: $companyNumber)
            }
            
            VStack(alignment: .leading) {
                Text("사업자 등록번호")
            }
        }
    }
}

struct MyInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoEditView(myInfo: MyStore())
    }
}
