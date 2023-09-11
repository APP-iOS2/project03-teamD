//
//  HomeStore.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/06.
//

import SwiftUI
//import FirebaseFirestoreSwift
//import FirebaseFirestore

final class HomeStore: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var EventList: [Event] = []
    @Published var hotPlace: [Place] = []
    @Published var recommendPlace: [Place] = []
    @Published var filteredArray:[Place] = []
    @Published var recentlyWords: [String] = []
    @Published var cities: [City] = []
//    let dbRef = Firestore.firestore().collection("Incruitments")
    
    var categories: [Category] = [
        Category(category: .shareOffice, categoryImageString:  "building.2"),
        Category(category: .bandRoom, categoryImageString:  "music.mic"),
        Category(category: .studio, categoryImageString:  "camera"),
        Category(category: .shareKitchen, categoryImageString:  "fork.knife"),
    ]
    
    init(){
        fetchPlace()
        settingEventBanner()
        settingHotPlace()
        settingRecommendPlace()
    }
    
//    @MainActor
//    func fetchPlaces() async throws -> Void {
//      let snapshot = try await dbRef.getDocuments()
//
//      let places = snapshot.documents.compactMap({try? $0.data(as: Place.self) })
//      self.places = places
//    }
//
    
    func fetchPlace(){
        places = placeArray
        cities = cityArray
    }
    func deleteRecentlyWord(word: String) {
        let index = recentlyWords.firstIndex {
            $0 == word
        }
        if let index {
            recentlyWords.remove(at: index)
        }
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
    
    func searchRecentlyWord(word: String) {
        recentlyWords.append(word)
    }
    
    func changeFavorite(place: Place){
       if let index = places.firstIndex(where:{
           $0.id == place.id }) {
           places[index].isFavorite.toggle()
       }
    }
    func filteredPlaceList(category: String, cities: [String]) {
        
        filteredArray.removeAll()
        var tempFilteredArray: [Place] = []
        let all = "전체"
        if cities.contains(all){
            for filteredPlace in places {
                if filteredPlace.category.rawValue == category {
                    tempFilteredArray.append(filteredPlace)
                }
            }
            filteredArray = tempFilteredArray
        } else {
            for filteredPlace in places {
                if filteredPlace.category.rawValue == category {
                    for sub in cities {
                        if filteredPlace.placeLocation.contains(sub){
                            tempFilteredArray.append(filteredPlace)
                        }
                    }
                }
            }
            filteredArray = tempFilteredArray
        }
//      if all != category {
//        for incruitment in incruitments {
//          if incruitment.jobCategory == category {
//            filteredIncruitments.append(incruitment)
//          }
//        }
//      }else{
//        filteredIncruitments = incruitments
//      }
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
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573181276170/canva---------Gpco5qgYLmU.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573550362666/canva--------BGJr497I-OM.jpg?width=1410&height=352",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282573881724979/canva----------mp-LcAtJ4yQ.jpg?width=1410&height=528",
    "https://media.discordapp.net/attachments/1148158635667632149/1149282575689469993/canva--------zIbSUFxMP-c.jpg?width=1410&height=470",
]


let cityArray: [City] = [
City(name: "서울특별시", subCity: SubCity(name: ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"])),
City(name: "부산광역시", subCity: SubCity(name: ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"])),
City(name: "대구광역시", subCity: SubCity(name: ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"])),
City(name: "인천광역시", subCity: SubCity(name: ["중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"])),
City(name: "광주광역시", subCity: SubCity(name: ["동구", "서구", "남구", "북구", "광산구"])),
City(name: "대전광역시", subCity: SubCity(name: ["동구", "중구", "서구", "유성구", "대덕구"])),
City(name: "울산광역시", subCity: SubCity(name: ["중구", "남구", "동구", "북구", "울주군"])),
City(name: "세종특별자치시", subCity: SubCity(name: ["세종시"])),
City(name: "강원도", subCity: SubCity(name: ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"])),
City(name: "충청북도", subCity: SubCity(name: ["청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "진천군", "괴산군", "음성군", "단양군"])),
City(name: "충청남도", subCity: SubCity(name: ["천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "연기군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"])),
City(name: "전라북도", subCity: SubCity(name: ["전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"])),
City(name: "전라남도", subCity: SubCity(name: ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"])),
City(name: "경상북도", subCity: SubCity(name: ["포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"])),
City(name: "경상남도", subCity: SubCity(name: ["창원시", "김해시", "진주시", "양산시", "거제시", "통영시", "사천시", "밀양시", "함안군", "거창군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거북군", "합천군"])),
City(name: "제주도", subCity: SubCity(name: ["제주시", "서귀포시"])),
]


