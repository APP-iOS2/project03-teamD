//
//  kakaoAPI.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import SwiftUI
import BinGongGanCore

struct AddressSearchView: View {
    @Binding var isShwoingSearchSheet: Bool
    
    @State private var searchText: String = ""
    @State private var searchResults: [Address] = []
    
    var addressClosure: (Address) -> ()
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea()
            List {
                CustomTextField(placeholder: "주소를 검색하세요", text: $searchText)
                    .onChange(of: searchText) { _ in
                        searchAddress()
                    }
                    .listRowSeparator(.hidden)
                
                ForEach(searchResults, id: \.address) { result in
                    Button {
                        searchText = result.address
                        addressClosure(result)
                        isShwoingSearchSheet = false
                        
                    } label: {
                        Text("\(result.placeName)  \(result.address)")
                            .font(.body1Bold)
                            .foregroundColor(.black)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShwoingSearchSheet = false
                    } label: {
                        Text("닫기")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("주소 검색")
        }
    }
    
    //메소드 스토어로 따로 분리 부탁드립니다요다요
    func searchAddress() {
        let apiKey = "8e088bfc28cca9de16fd5dd594dd32f1"
        
        let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://dapi.kakao.com/v2/local/search/keyword?query=\(query)&size=10"
        // 10개 까지만 출력
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("KakaoAK \(apiKey)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(AddressSearchResult.self, from: data)
                        DispatchQueue.main.async {
                            searchResults = result.documents
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
            .resume()
        }
    }
}

struct AddressSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AddressSearchView(isShwoingSearchSheet: .constant(false)) { Address in
            
        }
    }
}
