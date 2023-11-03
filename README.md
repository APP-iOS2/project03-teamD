# 빈공간
![BinGongGan Frame 55](https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/ba0ced76-f7e5-4601-b811-5cbdc278cad7)




## 📌 프로젝트 소개
> 개발기간 : 2023.09.04 ~ 2023.09.14 (10일간)
- 쉐어 오피스 등 공유 공간을 등록하고 예약할 수 있는 서비스 플랫폼
- 판매자는 공간을 등록하여 판매할 수 있고 사용자는 등록된 공간을 검색하고 예약


<br/><br/>

## 📌 설치 / 실행방법
- Xcode에서 BinGongGan.xcworkspace 파일 열기
- 아래 파일 필요
```plain
- GoogleService-Info.plist
- Firebase 프로젝트 생성 후 Authentication, Firestore Database, Storage 를 추가합니다.
```
- 테스트 아이디
```plain
- User: aaaa@aaaa.aaaa / asdf1234
- Biz: haha@naver.com / asdf1234
```


<br/><br/>

## 📌 기능 소개
### ⭐️ 빈공간 User 앱
<details>
<summary>회원가입/로그인</summary>
  
  - 이메일과 비밀번호를 입력하고 로그인 버튼을 누르면 홈 뷰로 넘어간다.
  - 데이터베이스에 없는 이메일 또는 비밀번호를 입력 하면 Alert로 로그인 실패 알림이 뜬다.
  - 회원가입 버튼을 누르면 회원가입 뷰로 넘어간다.
  - 회원가입 및 로그인은 Firebase Auth를 통해 인증할 수 있다.
  - 회원가입에 필요한 항목은 유효성 검사를 진행한다.
  - 이메일 중복검사를 통해 중복되지 않은 계정을 생성할 수 있다.
  - 휴대폰 번호를 입력한 후 본인 인증을 진행한다.(구현예정)
  - 로그인 정보는 앱 내에 저장되어 자동로그인을 할 수 있다.

</details>  


<details>
<summary>홈</summary>

- 내 주변을 검색하는 버튼을 통해 지도에서 공간들을 검색하러 이동할 수 있다.
- 공유오피스, 밴드룸, 스튜디오, 공유키친 4가지 카테로리를 선택해서 선택된 카테고리의 목록을 불러올 수 있다.
- 카테고리별로 정리된 공간들에서 지역을 선택해 필터링 해서 찾아볼 수 있다.
- 인기 플레이스에서 빈공간 플레이스의 인기 공간을 볼 수 있다.
- 랜덤 공간 추천을 사용하여 사용자들에게 다양한 공간의 정보를 보여준다.
- 이벤트 배너를 통해 광고 효과를 볼 수 있다.
- 공간을 선택해 클릭하게 되면 공간의 자세한 정보들을 볼 수 있다.
- 상세 정보에서 건물의 정보와 세부 룸의 정보를 확인하고 룸을 선택해 예약 신청을 할 수 있다.
- 공간에 전화 문의 할 수 있다. (실 기기만)
- 하트 버튼으로 공간을 찜 할 수 있다.
- 공간별로 사용자들이 등록한 리뷰를 확인 할 수 있다.
- 판매자가 등록한 공간의 공지사항을 확인 할 수 있다.
- 예약 신청시 선택한 방에 대한 정보가 간단하게 나타난다.
- 달력을 통해 예약할 날짜의 입실과 퇴실 날짜를 선택한다.
- 모든 필드를 채우지 않을 시 메세지창이 뜬다.
- 환불 사항을 꼭 확인 후 결제창으로 넘어갈 수 있다.
- 결제 확인 창에서 예약 내역을 확인할 수 있다.
  
</details>  


<details>
<summary>지도 검색</summary>

- 빈공간 앱은 공간명을 검색할 수 있을 뿐만 아니라 지도로도 검색할 수 있다.
- 오른 쪽 상단 < 뒤로 가기 버튼을 누르면 홈 뷰로 이동한다.
- 도로명 주소로 원하는 위치를 검색할 수 있다.(구현예정)
- 카테고리 버튼을 누를 시 카테고리 별로 리스트가 보이게 된다.
- 검색하게 되면 하단에 리스트들이 떠서 현재 예약 가능한 공간 목록을 볼 수 있다.
- 리스트 뿐만 아니라 지도 위에 핀을 누르게 되면 자세한 정보를 볼 수 있다.
- 하단 왼쪽에 현재 내 위치로 이동할 수 있는 버튼이 있다. (내 주변 검색 가능)

</details>  


<details>
<summary>찜</summary>  

- 공간들의 디테일 화면에서 하트 버튼을 토글하여 선택한 공간을 찜 하거나 취소 할 수 있다.
- 찜 한 공간들은 찜 탭에서 보여지게 된다.
- edit버튼으로 하트버튼을 토글하여 찜 목록에서 삭제 할 수 있다.

</details>  


<details>
<summary>마이페이지</summary>  
  
- 내정보에 대해 관리 할 수 있다.
  - 회원 정보를 수정할 수 있다.(닉네임,연락처,이름)
  - 계좌를 수정할 수 있다.(은행,계좌번호)
  - 계졍을 관리할 수 있다.(비밀번호 변경,회원탈퇴)
- 예약/리뷰 내역을 볼 수 있다.
  - 예약 내역을 볼 수 있다.(전체,예정,완료,취소)
  - 판매자에게 무통장 입금 후 승인을 기다려야 한다.(취소 가능)
  - 판매자가 승인하면 예약이 확정된다.(취소 가능)
  - 체크아웃 시간까지 별 다른 취소가 없으면 이용이 완료되어 리뷰를 작성할 수 있다.
  - 리뷰를 작성하면 이용이 완전 완료된다.
  - 상세보기를 누르면 예약 상세 화면이 나온다.
  - 리스트를 누르면 해당 공간뷰로 이동한다.
- 고객센터를 통해 문의를 할 수 있다.
  - 1:1 문의(상담원 연결,이메일 문의)를 할수있다.
  - 자주 묻는 FAQ로 볼 수 있다.
- 관리자가 등록한 앱 공지사항, 앱 정보를 볼 수 있다.
- 앱 설정(위치권한, 알림), 로그아웃을 할 수 있다.

</details>  

<table align="center">
  <tr>
    <th><code>홈/예약</code></th>
    <th><code>검색/찜</code></th>
    <th><code>지도</code></th>
    <th><code>마이페이지</code></th>
  </tr>
  <tr>
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/5c77a9cc-6fa2-4c9d-bf07-194025e3f984" alt="홈/예약">
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/19b12b98-2a7b-4612-a44d-ead62048231c" alt="검색/찜"></td>
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/a30e566c-6894-4b80-89f7-cfd6709f690f" alt="지도"></td>
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/23b6cd0e-80ef-408c-8a5d-02c185d92c7a" alt="마이페이지"></td>
  </tr>
</table>

<br/>

### ⭐️ 빈공간 Biz 앱
<details>
<summary>회원가입/로그인</summary>
  
- 이메일과 비밀번호를 입력하고 로그인 버튼을 누르면 홈 뷰로 넘어간다.
- 데이터베이스에 없는 이메일 또는 비밀번호를 입력 하면 Alert로 로그인 실패 알림이 뜬다.
- 회원가입 버튼을 누르면 회원가입 뷰로 넘어간다.
- 회원가입 및 로그인은 Firebase Auth를 통해 인증할 수 있다.
- 회원가입에 필요한 항목은 유효성 검사를 진행한다.
- 이메일 중복검사를 통해 중복되지 않은 계정을 생성할 수 있다.
- 휴대폰 번호를 입력한 후 본인 인증을 진행한다.(구현예정)
- 로그인 정보는 앱 내에 저장되어 자동로그인을 할 수 있다.
  
</details>


<details>
<summary>홈</summary>
  
- 전체 메뉴를 통해 판매자용 앱에서 제공하는 주요 기능 6가지에 접근할 수 있다.
- 판매자가 소유한 대여 공간에 새롭게 들어온 예약을 바로 확인 및 승인할 수 있다.
  
</details>


<details>
<summary>예약 관리</summary>
  
- 달력을 통해 전체적인 예약 현황과 날짜별 예약 내역에 대해 확인할 수 있다.
- 예약이 있는 날짜에는 날짜 위에 동그란 표시가 생기고, 날짜 아래에 예약 건수가 표시된다.
- 대기, 취소, 확정 내역을 분리하여 확인 및 관리할 수 있다.
  
</details>


<details>
<summary>리뷰 관리</summary>
  
- 판매자가 소유한 대여 공간별 리뷰를 확인할 수 있다.
- 리뷰에 최대 1개의 댓글을 작성할 수 있다.
- 부적절한 리뷰에 대해서는 적절한 신고 사유를 선택하여 신고 가능하다.
  
</details>


<details>
<summary>공지사항</summary>
  
- 판매자가 소유한 대여 공간별 공지사항을 관리할 수 있다.
- 공지를 특정 공간에만 올릴지, 소유한 전체 공간에 올릴지 선택할 수 있다.
  
</details>


<details>
<summary>내 공간</summary>
  
- 판매자의 정보가 명함 형식으로 나타난다.
- 공간 등록을 하지 않은 경우, 공간 등록을 위한 버튼이 하단에 나타난다.
  - 공간 이름, 공간 카테고리(쉐어오피스, 밴드룸, 스튜디오, 키친룸)을 입력 및 선택할 수 있다.
  - 주소 검색이 가능하며 검색한 주소 결과를 지도에 표시한다.
  - 공간 사진 등록과 공간 시설 선택, 공간 정보 입력이 가능하다.
- 공간 등록을 한 경우, 세부 공간을 등록 및 관리할 수 있는 스크롤 뷰가 나타난다.
  
</details>


<details>
<summary>내 정보</summary>
  
- 회원가입시 등록한 판매자의 정보를 확인할 수 있다.
- 전화번호, 계좌번호를 수정할 수 있다.
- 로그아웃과 회원탈퇴가 가능하다.
  
</details>

<table align="center">
  <tr>
    <th><code>예약관리/리뷰관리</code></th>
    <th><code>공지사항</code></th>
    <th><code>내 공간</code></th>
    <th><code>내 정보</code></th>
  </tr>
  <tr>
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/7555bed9-d3b6-42af-bbfe-b8e2a7e23d36" alt="예약관리/리뷰관리">
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/07ca1c74-1e69-4ce1-bda5-3a7366429e1d" alt="공지사항"></td>
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/ab91c982-9089-45c8-8f4f-82b5115f9626" alt="내 공간"></td>
    <td><img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/c2ffc1d2-a86d-4a85-b46f-4d75b939ec33" alt="내 정보"></td>
</td>
</table>



<br/>

### ⭐️ 빈공간 Admin 앱
<details>
<summary>공지관리</summary>
  
- 앱에 대한 공지(공지, 업데이트, 장애, 기타)를 작성할 수 있다.
- 사용자와 판매자 계정을 확인하고 관리할 수 있다.
- 판매자가 등록한 공간을 확인하고 관리할 수 있다.
- 사용자와 판매자가 작성한 댓글과 답글을 확인할 수 있다.
- 신고된 댓글을 확인하고 관리할 수 있다.

</details>
<img src="https://github.com/APPSCHOOL3-iOS/project03-teamD/assets/74815957/c3cc60bc-9d5e-4a3e-8bbf-cc1c3971adef" width="500">




<br/><br/>

## 📌 개발도구 및 기술스택
<img src="https://img.shields.io/badge/swift-F05138?style=for-the-badge&logo=swift&logoColor=white"><img src="https://img.shields.io/badge/xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white"><img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"><img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=black"><img src="https://img.shields.io/badge/SwiftUI-0070FD?style=for-the-badge&logo=swift&logoColor=black"><img src="https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white">

#### 개발환경
- Swift 5.9, Xcode 14.0, iOS 16.4 이상
#### 협업도구 
- Figma, Github, Notion
#### 기술스택
- SwiftUI
- FiresStore, Firebase Storage
- KakaoMapAPI, MapKit



<br/><br/>


## 📌 팀원소개
#### PM
<table>
  <tr align="center">
    <th>최하늘</th>
  </tr>
  <tr align="center">
    <td><img src="https://avatars.githubusercontent.com/u/74815957?v=4" width="100"></td>
  </tr>
  <tr align="center">
    <td><a href="https://github.com/HANLeeeee">@HANLeeeee</a></td>
  </tr>
</table>

#### User Team
<table>
  <tr align="center">
    <th>임대진</th>
    <th>이제현</th>
    <th>양성혜</th>
  </tr>
  <tr align="center">
    <td><img src="https://avatars.githubusercontent.com/u/115560272?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104299722?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/87599027?v=4" width="80"></td>
  </tr>
  <tr align="center">
    <td><a href="https://github.com/DAEJINLIM">@DAEJINLIM</a></td>
    <td><a href="https://github.com/LJH3904">@LJH3904</a></td>
    <td><a href="https://github.com/seongzzang">@seongzzang</a></td>
  </tr>
</table>

<table>
  <tr align="center">
    <th>윤지호</th>
    <th>마경미</th>
    <th>박지현</th>
  </tr>
  <tr align="center">
    <td><img src="https://avatars.githubusercontent.com/u/109410688?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/62610032?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/134076497?v=4" width="80"></td>
  </tr>
  <tr align="center">
    <td><a href="https://github.com/yoonjiho37">@yoonjiho37</a></td>
    <td><a href="https://github.com/akrudal">@akrudal</a></td>
    <td><a href="https://github.com/wowhyunnie">@wowhyunnie</a></td>
  </tr>
</table>

<table>
  <tr align="center">
    <th>방유빈</th>
    <th>손윤호</th>
    <th>조민근</th>
  </tr>
  <tr align="center">
    <td><img src="https://avatars.githubusercontent.com/u/58802345?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/94930261?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/127810279?v=4" width="80"></td>
  </tr>
  <tr align="center">
    <td><a href="https://github.com/bangtori">@bangtori</a></td>
    <td><a href="https://github.com/SonYoonho">@SonYoonho</a></td>
    <td><a href="https://github.com/LutherCho">@LutherCho</a></td>
  </tr>
</table>


#### Biz Team
<table>
  <tr align="center">
    <th>박채영</th>
    <th>김민기</th>
    <th>신희권</th>
    <th>오영석</th>
    <th>윤경환</th>
  </tr>
  <tr align="center">
    <td><img src="https://avatars.githubusercontent.com/u/72439620?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/79855248?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/55128158?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/82360640?v=4" width="80"></td>
    <td><img src="https://avatars.githubusercontent.com/u/133959724?v=4" width="80"></td>
  </tr>
  <tr align="center">
    <td><a href="https://github.com/choala">@choala</a></td>
    <td><a href="https://github.com/minki-kim-git">@minki-kim-git</a></td>
    <td><a href="https://github.com/hhh131">@hhh131</a></td>
    <td><a href="https://github.com/Youngs5">@Youngs5</a></td>
    <td><a href="https://github.com/kempt007">@kempt007</a></td>
  </tr>
</table>


<br/><br/>



## 📌 License
"BinGongGan" is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

