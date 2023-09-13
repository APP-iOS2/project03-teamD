//
//  ReservationTossAlert.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/13.
//

import SwiftUI

struct ReservationTossAlert: View {
    
    @Binding var isPresented: Bool
    let title: String
    let content: String
    let primaryButtonTitle: String
    let primaryAction: () -> Void

    var body: some View {
      VStack(spacing: 22) {

        Text(title)
          .font(.title3)
          .bold()
          .foregroundColor(.black)

        Divider()

          VStack {
              
              Image(systemName: "person.crop.circle")
                  .foregroundColor(.myBrown)
                  .font(.system(size: 50))
                  .padding(.bottom, 10)
              
              Text(content)
                  .bold()
                  .font(.body)
          }

        Button {
          primaryAction()
          isPresented = false
        } label: {
          Text(primaryButtonTitle)
            .font(.title3)
            .bold()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
      }
      .padding(.horizontal, 24)
      .padding(.vertical, 18)
      .frame(width: 300)
      .background(
        RoundedRectangle(cornerRadius: 30)
          .stroke(Color.myBrown.opacity(0.5))
          .background(
            RoundedRectangle(cornerRadius: 30)
              .fill(.white)
          )
      )
    }
  }

struct ReservationTossAlert_Previews: PreviewProvider {
    static var previews: some View {
        ReservationTossAlert(isPresented: .constant(true), title: "결제 확인", content: "계좌번호로 2일 내에 입금 부탁드립니다", primaryButtonTitle: "확인", primaryAction: {})
    }
}
