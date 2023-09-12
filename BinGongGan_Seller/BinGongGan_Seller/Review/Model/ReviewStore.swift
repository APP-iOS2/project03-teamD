//
//  ReviewStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import Foundation
import BinGongGanCore
import FirebaseFirestore

final class ReviewStore: ObservableObject {
    @Published var reviewList: [Review] = []
    
}
