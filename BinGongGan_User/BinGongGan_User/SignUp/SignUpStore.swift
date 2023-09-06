//
//  SignUpStore.swift
//  BinGongGan_User
//
//  Created by 마경미 on 06.09.23.
//
import Foundation
import SwiftUI

struct SignUpData {
    var name: String = ""
    var birthDate: String = ""
    var phoneNumber: String = ""
    var emailId: String = ""
    var password: String = ""
    var passwordCheck: String = ""
    var agreement: Bool = false
}

enum SignUpStep {
    case first
    case second
    case third
}

final class SignUpStore: ObservableObject {
    @Published var signUpData = SignUpData()
    @State var certificateNumber: String = ""
    @Published var currentStep: SignUpStep = .first
}
