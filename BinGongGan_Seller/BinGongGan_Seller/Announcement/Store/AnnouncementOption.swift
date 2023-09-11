//
//  AnnouncementOption.swift
//  BinGongGan_Seller
//
//  Created by 오영석 on 2023/09/08.
//

import Foundation

enum AnnouncementOptionCase: String, CaseIterable, Codable {
    case share = "공유"
    case keep = "보관"
    case edit = "공지 수정"
    case delete = "공지 삭제"
}

struct AnnouncementOption: Identifiable {
    var id: UUID = UUID()
    var optionIamge: String
    var option: String

    static let data = [
        AnnouncementOption(optionIamge: "square.and.arrow.up", option: AnnouncementOptionCase.share.rawValue),
        AnnouncementOption(optionIamge: "clock.arrow.circlepath", option: AnnouncementOptionCase.keep.rawValue),
        AnnouncementOption(optionIamge: "pencil", option: AnnouncementOptionCase.edit.rawValue),
        AnnouncementOption(optionIamge: "trash", option: AnnouncementOptionCase.delete.rawValue)
    ]
}
