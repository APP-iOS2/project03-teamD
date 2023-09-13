import SwiftUI
import BinGongGanCore

struct BankSelectView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresentedSelectBankSheet: Bool
    @Binding var isSelectedBank: Bool
    @Binding var selectedBank: Bank?
    
    var body: some View {
        VStack {
            HStack {
                Text("은행선택")
                    .font(.head1Bold)
                    .padding(.leading, 20)
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 0) {
                ForEach(Bank.banks) { bank in
                    Button {
                        selectedBank = bank
                        dismiss()
                        isSelectedBank = true
                    } label: {
                        BankItemView(bank: bank)
                    }
                }
            }
            .padding(.leading, 20)
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct BankItemView: View {
    let bank: Bank
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: bank.imageString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 25, maxHeight: 25)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            Text("\(bank.name)")
                .foregroundColor(.black)
                .font(.body1Bold)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical)
        .cornerRadius(10)
    }
}

struct BankSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BankSelectView(isPresentedSelectBankSheet: .constant(false), isSelectedBank: .constant(false), selectedBank: .constant(Bank(name: "신한은행", imageString: "")))
        }
    }
}
