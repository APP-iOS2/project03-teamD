//
//  FAQItemModel.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/07.
//

import Foundation

struct FAQItem: Identifiable {
    var id: UUID = UUID()
    let category: FAQCategory
    let title: String
    let content: String
}

extension FAQItem {
    static let sampleFAQItems: [FAQItem] = [
        FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
        FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
        FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
        FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
        FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
        FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
        FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
        FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
        FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
        FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
        FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
        FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
        FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
        FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
        FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
        FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
        FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
        FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
        FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
        FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
        FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
        FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
        FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
        FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
        FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
        FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
        FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
        FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
        FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
        FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
    ]
    
    static func filterFAQCategory(of category: FAQCategory) -> [FAQItem] {
        return sampleFAQItems.filter { $0.category == category }
    }
}

enum FAQCategory: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case accountCertifiedSignIn = "계정/인증/로그인"
    case reservation = "예약"
    case search = "검색"
    case payment = "결제"
    case operationalPolicy = "운영정책"
}
