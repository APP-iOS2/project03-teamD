//
//  ReplyStore.swift
//  BinGongGan_Seller
//
//  Created by 박채영 on 2023/09/12.
//

import Foundation
import BinGongGanCore

final class ReplyStore: ObservableObject {
    @Published var replies: [Reply] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        
    }
    
    func uploadReply(newReply: Reply) {
        replies.append(newReply)
    }
}
