//
//  DatePickerContent.swift
//  BinGongGan_Seller
//
//  Created by 김민기 on 2023/09/06.
//

import Foundation

enum DatePickerContent: String, CaseIterable, Identifiable {
    case lastMonth, lastWeak, today
    var id: Self { self }
    
}
