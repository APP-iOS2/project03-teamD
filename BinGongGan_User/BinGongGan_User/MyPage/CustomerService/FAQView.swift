import SwiftUI
import BinGongGanCore

struct FAQView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCategory: String = "계정/인증/로그인"
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal) {
                    FAQCategoryItemView(selectedItem: $selectedCategory, scrollViewProxy: scrollViewProxy)
                        .padding([.horizontal, .top])
                }
                
                .scrollIndicators(.hidden)
                
                List {
                    ForEach(FAQCategory.allCases) { category in
                        Section {
                            ForEach(FAQItem.filteredCategory(of: category)) { item in
                                Text(item.title)
                            }
                        } header: {
                            Text(category.rawValue)
                        }
                    }
                }
                .onChange(of: selectedCategory) { newCategory in
                    withAnimation {
                        scrollViewProxy.scrollTo(newCategory, anchor: .top)
                    }
                }
            }
            .background(Color.myBackground)
            .navigationTitle("자주 묻는 FAQ")
            .navigationBarTitleDisplayMode(.inline)
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
        .navigationBarBackButtonHidden(true)
    }
}

struct FAQItem: Identifiable {
    var id: UUID = UUID()
    let category: FAQCategory
    let title: String
    let content: String
}

extension FAQItem {
    static func filteredCategory(of category: FAQCategory) -> [FAQItem] {
        return sampleFAQItemsRepeated.filter { $0.category == category }
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

let faqCategories: [FAQCategory] = [
    .accountCertifiedSignIn,
    .reservation,
    .search,
    .payment,
    .operationalPolicy
]

let sampleFAQItems: [FAQItem] = [
    FAQItem(category: .accountCertifiedSignIn, title: "로그인이 정상적으로 되지 않아요!", content: "답변 1"),
    FAQItem(category: .reservation, title: "예약은 어떤식으로 진행되나요?", content: "답변 3"),
    FAQItem(category: .search, title: "지역 이름으로 검색할 수 있나요?", content: "답변 4"),
    FAQItem(category: .payment, title: "결제완료 후 예약확정이 되지않아요", content: "답변 5"),
    FAQItem(category: .operationalPolicy, title: "자주 이용하는데 혜택은 없나요?", content: "답변 6"),
]

let sampleFAQItemsRepeated = Array(repeating: sampleFAQItems, count: 6).flatMap { $0 }

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FAQView()
        }
    }
}
