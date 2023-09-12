//
//  HomeDummy.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/05.
//

import SwiftUI
import FirebaseFirestoreSwift

enum CategoryCase: String {
    case shareOffice = "공유오피스"
    case bandRoom = "밴드룸"
    case studio = "스튜디오"
    case shareKitchen = "공유주방"
}

struct Event: Identifiable {
    let id = UUID().uuidString
    let eventImage: String
    var imageURL: URL {
        URL(string: eventImage)!
    }
}

struct Category : Identifiable {
    let id = UUID().uuidString
    let category: String
    let categoryImageString: String
    var imageURL: URL {
        URL(string: categoryImageString)!
    }
}

struct Place : Identifiable, Hashable {
    var id = UUID().uuidString
    var placeName: String
    let category: String
    let placeLocation: String
    let placePrice: Int
    let imageString: String
    var imageURL: URL {
        URL(string: imageString)!
    }
    var isFavorite: Bool
}

//let placeArray: [Place] = [
//    Place(
//        placeName: "임대진공용오피스", category: "쉐어오피스", placeLocation: "강남구",
//        placePrice: 12000, placeString: imageArray[0] , isFavorite: false),
//    ]
//    Place(
//        placeName: "이제현합주실", category: .bandRoom, placeLocation: "강서구",
//        placePrice: 13000, placeString: imageArray[1] , isFavorite: false),
//    Place(
//        placeName: "양성혜공유주방", category: .shareKitchen, placeLocation: "강동구",
//        placePrice: 14000, placeString: imageArray[2] , isFavorite: false),
//    Place(
//        placeName: "윤지호스튜디오", category: .studio, placeLocation: "강북구",
//        placePrice: 15000, placeString: imageArray[3] , isFavorite: false),
//    Place(
//        placeName: "마경미오피스", category: .shareOffice, placeLocation: "성북구",
//        placePrice: 16000, placeString: imageArray[4] , isFavorite: false),
//    Place(
//        placeName: "박지현합주실", category: .bandRoom, placeLocation: "종로구",
//        placePrice: 17000, placeString: imageArray[5] , isFavorite: false),
//    Place(
//        placeName: "방유빈비주얼스튜디오", category: .studio, placeLocation: "중구",
//        placePrice: 18000, placeString: imageArray[6] , isFavorite: false),
//    Place(
//        placeName: "손윤호고양이주방", category: .shareKitchen, placeLocation: "용산구",
//        placePrice: 19000, placeString: imageArray[7] , isFavorite: false),
//    Place(
//        placeName: "조민근스튜디오", category: .studio, placeLocation: "광진구",
//        placePrice: 70000, placeString: imageArray[8] , isFavorite: false),
//    Place(
//        placeName: "박채영스튜디오", category: .studio, placeLocation: "동대문구",
//        placePrice: 80000, placeString: imageArray[9] , isFavorite: false),
//    Place(
//        placeName: "윤경환해병대주방", category: .shareKitchen, placeLocation: "용산구",
//        placePrice: 90000, placeString: imageArray[10] , isFavorite: false),
//    Place(
//        placeName: "신희권공유칼방", category: .shareKitchen, placeLocation: "용산구",
//        placePrice: 20000, placeString: imageArray[11] , isFavorite: false),
//    Place(
//        placeName: "김민기합주합주", category: .bandRoom, placeLocation: "용산구",
//        placePrice: 40000, placeString: imageArray[12] , isFavorite: false),
//    Place(
//        placeName: "오영석공주오피스", category: .shareOffice, placeLocation: "용산구",
//        placePrice: 40000, placeString: imageArray[13] , isFavorite: false),
//    Place(
//        placeName: "최하늘공주밴드밴드룸", category: .bandRoom, placeLocation: "마포구",
//        placePrice: 99999, placeString: imageArray[14] , isFavorite: false),
//]
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
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573181276170/canva---------Gpco5qgYLmU.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573550362666/canva--------BGJr497I-OM.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573881724979/canva----------mp-LcAtJ4yQ.jpg?width=1410&height=528",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282575689469993/canva--------zIbSUFxMP-c.jpg?width=1410&height=470",
]


