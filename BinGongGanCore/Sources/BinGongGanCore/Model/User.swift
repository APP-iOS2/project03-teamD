//
//  File.swift
//  
//
//  Created by 방유빈 on 2023/09/08.
//



import Foundation

public struct User: Identifiable {
    public var email: String //이메일
    public var name: String //이름
    public var nickname: String //닉네임
    public var phoneNumber: String //전화번호
    public var password: String //패스워드
    public var birthDate: String //생년월일
    public var accountNumber: String? //환불계좌번호
    public var accountHolder: String? //환불계좌 예금주
    
    public var id: String {
        return email
    }
    
    public init(email: String, name: String, nickname: String, phoneNumber: String, password: String, birthDate: String, accountNumber: String? = nil, accountHolder: String? = nil) {
        self.email = email
        self.name = name
        self.nickname = nickname
        self.phoneNumber = phoneNumber
        self.password = password
        self.birthDate = birthDate
        self.accountNumber = accountNumber
        self.accountHolder = accountHolder
    }
}
