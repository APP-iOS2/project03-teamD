//
//  ReviewManageView.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/05.
//

import SwiftUI
import BinGongGanCore

struct ReviewManageView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedPlace: String = ""
    
    var places: [String] = ["전체", "공간1", "공간2"]
    
    var body: some View {
        ZStack {
            Color.myBackground
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Picker("Place", selection: $selectedPlace) {
                            ForEach(places, id: \.self) { place in
                                Text("\(place)")
                            }
                        }
                    }
                    
                    ForEach(1...3, id: \.self) { _ in
                        NavigationLink {
                            ReviewManageDetailView()
                        } label: {
                            ReviewCell()
                                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        }
                    }

                    Spacer()
                }
                .navigationTitle("리뷰 관리")
            }
        }
        .navigationBarBackButtonHidden(true)
        .scrollContentBackground(.hidden)
        .background(Color.myBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.myBrown)
                }
            }
        }
    }
}

struct ReviewManageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReviewManageView()
        }
    }
}
