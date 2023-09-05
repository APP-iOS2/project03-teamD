//
//  ReservationStore.swift
//  BinGongGan_User
//
//  Created by 양성혜 on 2023/09/05.
//

import Foundation

final class ReservationStore: ObservableObject {
    
    @Published var reservation: Reservation?
    
    let sampleSpace: SampleSpace = SampleSpace(spaceName: "[서울역]갬성 파티룸", roomName: "202호 불타는 애플", image: "https://cdn.e2news.com/news/photo/202301/249694_103455_5758.png")
    }


