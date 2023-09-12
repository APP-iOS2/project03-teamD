//
//  AnnouncementStore.swift
//  BinGongGan_Admin
//
//  Created by 방유빈 on 2023/09/13.
//

import Foundation

class AnnouncementStore: ObservableObject {
    @Published var announcementList: [SystemAnnouncement] = []
    
    init() {}
    
}
