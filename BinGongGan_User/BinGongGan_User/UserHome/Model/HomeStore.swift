//
//  HomeStore.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI

final class HomeStore: ObservableObject {
    
    @Published var EventList: [Event] = []
    @Published var places: [Place] = []
    @Published var hotPlace: [Place] = []
    @Published var recommendPlace: [Place] = []
    @Published var filteredArray:[Place] = []
    var categories: [Category] = [
        Category(category: .shareOffice, categoryImageString:  "building.2"),
        Category(category: .bandRoom, categoryImageString:  "music.mic"),
        Category(category: .studio, categoryImageString:  "camera"),
        Category(category: .shareKitchen, categoryImageString:  "fork.knife"),
    ]
    
    init(){
        settingEventBanner()
        places = placeArray
        settingHotPlace()
        settingRecommendPlace()
    }
    
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
    
    func settingEventBanner(){
        for i in eventImageArray.shuffled() {
            EventList.append(Event(eventImage: i))
        }
    }
    
    func settingHotPlace() {
        // 추후구현
        let temp: [Place] = places
        var count: Int = 0
        
        hotPlace.removeAll()
        for i in temp {
            if count == 4 {
                return
            }else{
                hotPlace.append(i)
                count += 1
            }
        }
    }
    
    func settingRecommendPlace() {
        var temp: [Place] = places
        var count: Int = 0
        temp.shuffle()
        recommendPlace.removeAll()
        for i in temp {
            if count == 4 {
                return
            }else{
                recommendPlace.append(i)
                count += 1
            }
        }
    }
    
    
}

// 밑은 전부 데모입니다
let placeArray: [Place] = [
    Place(
        placeName: "임대진공용오피스", category: .shareOffice, placeLocation: "강남구",
        placePrice: 12000, placeString: imageArray[0] , isFavorite: false),
    Place(
        placeName: "이제현합주실", category: .bandRoom, placeLocation: "강서구",
        placePrice: 13000, placeString: imageArray[1] , isFavorite: false),
    Place(
        placeName: "양성혜공유주방", category: .shareKitchen, placeLocation: "강동구",
        placePrice: 14000, placeString: imageArray[2] , isFavorite: false),
    Place(
        placeName: "윤지호스튜디오", category: .studio, placeLocation: "강북구",
        placePrice: 15000, placeString: imageArray[3] , isFavorite: false),
    Place(
        placeName: "마경미오피스", category: .shareOffice, placeLocation: "성북구",
        placePrice: 16000, placeString: imageArray[4] , isFavorite: false),
    Place(
        placeName: "박지현합주실", category: .bandRoom, placeLocation: "종로구",
        placePrice: 17000, placeString: imageArray[5] , isFavorite: false),
    Place(
        placeName: "방유빈비주얼스튜디오", category: .studio, placeLocation: "중구",
        placePrice: 18000, placeString: imageArray[6] , isFavorite: false),
    Place(
        placeName: "손윤호고양이주방", category: .shareKitchen, placeLocation: "용산구",
        placePrice: 19000, placeString: imageArray[7] , isFavorite: false),
    Place(
        placeName: "조민근스튜디오", category: .studio, placeLocation: "광진구",
        placePrice: 70000, placeString: imageArray[8] , isFavorite: false),
    Place(
        placeName: "박채영스튜디오", category: .studio, placeLocation: "동대문구",
        placePrice: 80000, placeString: imageArray[9] , isFavorite: false),
    Place(
        placeName: "윤경환해병대주방", category: .shareKitchen, placeLocation: "용산구",
        placePrice: 90000, placeString: imageArray[10] , isFavorite: false),
    Place(
        placeName: "신희권공유칼방", category: .shareKitchen, placeLocation: "용산구",
        placePrice: 20000, placeString: imageArray[11] , isFavorite: false),
    Place(
        placeName: "김민기합주합주", category: .bandRoom, placeLocation: "용산구",
        placePrice: 40000, placeString: imageArray[12] , isFavorite: false),
    Place(
        placeName: "오영석공주오피스", category: .shareOffice, placeLocation: "용산구",
        placePrice: 40000, placeString: imageArray[13] , isFavorite: false),
    Place(
        placeName: "최하늘공주밴드밴드룸", category: .bandRoom, placeLocation: "마포구",
        placePrice: 99999, placeString: imageArray[14] , isFavorite: false),
]


let imageArray: [String] = [
    "https://cdn.discordapp.com/attachments/1148158635667632149/1148878163062030356/2023-09-06_4.11.30.png",
    "https://054soundville.or.kr/wp-content/uploads/2021/08/001-2.jpg",
    "https://m-img.cafe24.com/images/soho/head/studio3.jpg",
    "https://publy.imgix.net/images/2019/07/24/1563948016_tVB4pADV5hoENmj6E5Tx3VhBQPtdqjk3BNLMM4NO.jpeg?fm=pjpg",
    "https://www.sisajournal.com/news/photo/201904/184366_89603_2018.jpg",
    "https://modo-phinf.pstatic.net/20200111_247/1578700444236N5V5d_JPEG/mosaOQGJ0g.jpeg?type=w1100",
    "https://mediahub.seoul.go.kr/uploads/mediahub/2021/04/ttAjLhIJrAEvYwxfHvUDzqgmoTFgwdzU.jpg",
    "https://www.sisajournal.com/news/photo/202012/209647_116841_213.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Visual_Studio_Icon_2022.svg/160px-Visual_Studio_Icon_2022.svg.png",
    "https://dora-guide.com/wp-content/uploads/2019/11/Visual-studio-code-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%82%AC%EC%9A%A9%EB%B2%95.png",
    "https://img.khan.co.kr/news/2023/05/29/news-p.v1.20230529.a67d3f1ade114d6f938f9adbdcb49c41_P1.webp",
    "https://cdn.ngonews.kr/news/photo/202003/116812_68785_5246.jpg",
    "https://i.namu.wiki/i/0zSVDV7X0RkgUYJOc9F-zkhsDl-QiCkgMy1KgF8jFd43geqYG2g_PxznsA3Kb8jvIOEZZaQydRgYXxRO0QVyCBylJ9bJjeUVemkh1ikksyVxYM-iAheHnJmOCRjthMA10dhk4DBJkrcw66l7gGUrfg.webp",
    "https://img.hankyung.com/photo/202101/AD.25064302.1.jpg",
    "https://www.seenews365.com/news/photo/201707/16539_11138_1159.jpg"
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
