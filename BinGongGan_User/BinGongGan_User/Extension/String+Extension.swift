//
//  String+Extension.swift
//  BinGongGan_User
//
//  Created by SONYOONHO on 2023/09/07.
//

import Foundation

extension String {
    /// 숫자로만된 전화번호를 '-'가 포함된 문자열로 변환
    func formatPhoneNumber() -> String {
        guard self.count == 11 else { return self }
        
        let firstPart = self.prefix(3)
        let secondPart = self.dropFirst(3).prefix(4)
        let thirdPart = self.dropFirst(7).prefix(4)
        
        return "\(firstPart)-\(secondPart)-\(thirdPart)"
    }
    
    /// 숫자로된 6자리 생년월일을 '-'가 포함된 문자열로 반환
    func formatBirthDate() -> String {
        let year = self.prefix(2)
        let month = self.dropFirst(2).prefix(2)
        let date = self.dropFirst(4).prefix(2)
        
        let currentYear = Calendar.current.component(.year, from: Date())
        
        var fullYear: String
        if let shortYear = Int(year), shortYear >= (currentYear % 100) {
            fullYear = "19\(year)"
        } else {
            fullYear = "20\(year)"
        }
        
        return "\(fullYear)-\(month)-\(date)"
    }
}

