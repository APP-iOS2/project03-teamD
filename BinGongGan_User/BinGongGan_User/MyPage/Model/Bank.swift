//
//  BankInformation.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/12.
//

import Foundation
import BinGongGanCore

struct Bank: Identifiable {
    var id: UUID
    var name: String
    var imageString: String
    
    init(id: UUID = UUID(), name: String, imageString: String) {
        self.id = id
        self.name = name
        self.imageString = imageString
    }
}

extension Bank {
    static let banks: [Bank] = [
        Bank(name: "국민은행", imageString: "https://apprecs.org/gp/images/app-icons/300/8b/com.kbstar.kbbank.jpg"),
        Bank(name: "카카오뱅크", imageString: "https://play-lh.googleusercontent.com/HTBCHqXZ01RhNVzIDwsA2ARURfzXeHxoWfsmgH92ieCgIG1CuPpJRWqCfJ9KgkwWStko"),
        Bank(name: "우리은행", imageString: "https://cdn.businessplus.kr/news/photo/201811/17999_10940_1715.jpg"),
        Bank(name: "신한은행", imageString: "https://www.shinhanfundpartners.com/wp/wp-content/uploads/2022/09/logo_p.png"),
        Bank(name: "농협은행", imageString: "https://mblogthumb-phinf.pstatic.net/20160501_161/ppanppane_146206873822759cXx_PNG/%B8%F1%BF%EC%C3%CC_%B7%CE%B0%ED_%282%29.png?type=w800"),
        Bank(name: "하나은행", imageString: "https://pbs.twimg.com/profile_images/1223128080727691265/yp_bP9cU_400x400.jpg"),
    ]
}

extension User {
    var bank: Bank? {
        return Bank.banks.first { $0.name == accountBank }
    }
}
