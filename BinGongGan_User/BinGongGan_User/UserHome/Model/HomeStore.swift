//
//  HomeStore.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI

final class HomeStore: ObservableObject {
    
    @Published var EventList: [Event] = [
        Event(eventImage: eventImageArray[0] ),
        Event(eventImage: eventImageArray[1] ),
        Event(eventImage: eventImageArray[2] ),
        Event(eventImage: eventImageArray[3] ),
        Event(eventImage: eventImageArray[4] ),
        Event(eventImage: eventImageArray[5] ),
        Event(eventImage: eventImageArray[6] ),
        Event(eventImage: eventImageArray[7] ),
    ]
    
    var categories: [Category] = [
        Category(category: .shareOffice,   categoryImageString: categoryImageArray[0] ),
        Category(category: .bandRoom,      categoryImageString: categoryImageArray[1] ),
        Category(category: .studio,        categoryImageString: categoryImageArray[2] ),
        Category(category: .shareKitchen,  categoryImageString: categoryImageArray[3] ),
    ]
    
    @Published var places: [Place] = [
        Place(
            placeName: "강남 햇님공용오피스", category: .shareOffice, placeLocation: "강남구",
            placePrice: 12000, placeString: imageArray[0] , isFavorite: false),
        Place(
            placeName: "강서 달님합주실", category: .bandRoom, placeLocation: "강서구",
            placePrice: 12000, placeString: imageArray[1] , isFavorite: false),
        Place(
            placeName: "강동 하늘공유주방", category: .shareKitchen, placeLocation: "강동구",
            placePrice: 12000, placeString: imageArray[2] , isFavorite: false),
        Place(
            placeName: "강북 땅스튜디오", category: .studio, placeLocation: "강북구",
            placePrice: 12000, placeString: imageArray[3] , isFavorite: false),
    ]
    
    @Published var filteredArray:[Place] = []
    
    func searchPlaceName(placess: [Place] , keyWord: String) {

        filteredArray.removeAll()
        for place in placess {
            let key = keyWord.lowercased()
            let placeName = place.placeName.lowercased()
            let placeLocation = place.placeLocation.lowercased()
            if placeName.contains(key) || placeLocation.contains(key){
                filteredArray.append(place)
            }
        }
    }
    
    static func backButton(_ string: String) -> some View {
        AsyncImage(url: URL(string: string), content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50 , height: 50)
                .cornerRadius(15)
        }) {
            ProgressView()
        }
    }
}

let imageArray: [String] = [
    "https://cdn.discordapp.com/attachments/1148158635667632149/1148878163062030356/2023-09-06_4.11.30.png",
    "https://054soundville.or.kr/wp-content/uploads/2021/08/001-2.jpg",
    "https://m-img.cafe24.com/images/soho/head/studio3.jpg",
    "https://publy.imgix.net/images/2019/07/24/1563948016_tVB4pADV5hoENmj6E5Tx3VhBQPtdqjk3BNLMM4NO.jpeg?fm=pjpg",
]

let eventImageArray: [String] = [
    "https://media.discordapp.net/attachments/1148158635667632149/1149282476380934234/2023-09-07_6.58.09.png?width=1410&height=408",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282166413459536/2023-09-07_6.56.57.png?width=1410&height=402",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282508807086171/2023-09-07_6.58.02.png?width=1410&height=410",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573181276170/canva---------Gpco5qgYLmU.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573550362666/canva--------BGJr497I-OM.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573881724979/canva----------mp-LcAtJ4yQ.jpg?width=1410&height=528",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573550362666/canva--------BGJr497I-OM.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282575689469993/canva--------zIbSUFxMP-c.jpg?width=1410&height=470",
]

let categoryImageArray: [String] = [
  "building.2",
  "music.mic",
  "camera",
  "fork.knife",
]
