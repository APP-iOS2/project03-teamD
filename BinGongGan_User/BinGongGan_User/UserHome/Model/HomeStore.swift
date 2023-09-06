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
    ]
    
    var categories: [Category] = [
        Category(category: .shareOffice,   categoryImageString: imageArray[0] ),
        Category(category: .bandRoom,      categoryImageString: imageArray[1] ),
        Category(category: .studio,        categoryImageString: imageArray[2] ),
        Category(category: .shareKitchen,  categoryImageString: imageArray[3] ),
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
                .frame(width: ImageLogoConstant.width , height: ImageLogoConstant.height)
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
    "https://file.bodnara.co.kr/logo/insidelogo.php?image=%2Fhttp%3A%2F%2Ffile.bodnara.co.kr%2Fwebedit%2Fnews%2F2015%2F1480474047-13.jpg",
    "https://www.vtimes.kr/news/photo/202206/44710_20771_416.jpg",
    "https://www.dailypop.kr/news/photo/202210/63780_121830_4158.png"
]
