//
//  kakaoAPI.swift
//  BinGongGan_Seller
//
//  Created by 신희권 on 2023/09/11.
//

import SwiftUI

struct AddressSearchView: View {
    @Binding var searchText:String
    @State private var searchResults: [Address] = []
    @Binding var isShwoingSearchSheet:Bool
    var body: some View {
        VStack {
            TextField("주소를 검색하세요", text: $searchText, onCommit: {
                // 검색 버튼을 누를 때 네트워크 요청을 수행합니다.
                searchAddress()
            })
            .onChange(of: searchText) { _ in
                // 사용자 입력이 변경될 때마다 주소 제안 리스트 업데이트
                searchAddress()
            }
            
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            List(searchResults, id: \.address) { result in
                Button {
                    searchText = result.address
                    isShwoingSearchSheet = false
                } label: {
                    Text("\(result.address)")
                }

            }
        }
    }
    
    func searchAddress() {
        let apiKey = "8e088bfc28cca9de16fd5dd594dd32f1"
        
        let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://dapi.kakao.com/v2/local/search/address.json?query=\(query)&analyze_type=similar"
        let keywordsearchUrl = "https://dapi.kakao.com/v2/local/search/keyword?query=\(query)&size=10"
        if let url = URL(string: keywordsearchUrl) {
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
            }.resume()
        }
    }
}

struct Address: Codable, Identifiable {
    var id: UUID = UUID()
    var address: String
    
    enum CodingKeys: String, CodingKey {
        case address = "address_name"
    }
}

struct AddressSearchResult: Codable {
    var documents: [Address]
}

struct AddressSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AddressSearchView(searchText: .constant(""), isShwoingSearchSheet: .constant(false))
    }
}
