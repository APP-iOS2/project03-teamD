//
//  String+Extension.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/07.
//

import Foundation

extension String {
    // MARK: 숫자로만된 전화번호를 '-'가 합쳐진 문자열로 변환
    func formatPhoneNumber() -> String {
        guard self.count == 11 else { return self } // 11자리가 아니면 그대로 반환
        
        let firstPart = self.prefix(3)
        let secondPart = self.dropFirst(3).prefix(4)
        let thirdPart = self.dropFirst(7).prefix(4)
        
        return "\(firstPart)-\(secondPart)-\(thirdPart)"
    }
}
