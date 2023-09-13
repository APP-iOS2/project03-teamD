//
//  Seller.swift
//
//
//  Created by 김민기 on 2023/09/12.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public struct Seller: Identifiable, Codable {
    @DocumentID public var id: String?
    public var name: String
    public var birthDate: String
    public var phoneNumber: String
    public var bankName: String
    public var accountNumber: String
    public var email: String
    public var nickname: String
    public var password: String
    ///사업자 등록번호
    public var registrationNum: String
    ///사업자 등록증
    public var registrationImage : String
    public init(id: String, name: String, birthDate: String, bankName: String, accountNumber: String, phoneNumber: String, email: String, nickname: String, password: String, registrationNum:String,registrationImage:String ) {
        self.id = id
        self.email = email
        self.name = name
        self.nickname = nickname
        self.phoneNumber = phoneNumber
        self.bankName = bankName
        self.accountNumber = accountNumber
        self.password = password
        self.birthDate = birthDate
        self.registrationNum = registrationNum
        self.registrationImage = registrationImage
    }
    
}
