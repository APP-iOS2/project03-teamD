import SwiftUI
import BinGongGanCore

struct FAQView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCategory: String = "계정/인증/로그인"
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView(.horizontal) {
                FAQCategoryItemView(selectedItem: $selectedCategory, scrollViewProxy: scrollViewProxy)
                    .padding([.horizontal, .top])
            }
            .scrollIndicators(.hidden)
            
            List {
                ForEach(FAQCategory.allCases) { category in
                    Section {
                        ForEach(FAQItem.filterFAQCategory(of: category)) { item in
                            NavigationLink {
                                Text("\(item.content)")
                            } label: {
                                Text("\(item.title)")
                            }
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
        .customBackbutton()
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FAQView()
        }
    }
}
