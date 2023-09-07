//
//  PaymentView.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/06.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("이용딩일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.")
                .foregroundColor(.red)
            Text("결제 후 2시간 이내에는 100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)")
        }
        .padding(20)
            .navigationTitle("환불 규정 안내")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
