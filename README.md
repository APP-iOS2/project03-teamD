# 빈공간
![페이지 아이콘](https://tin-slug-eb7.notion.site/image/https%3A%2F%2Fmedia.discordapp.net%2Fattachments%2F1145881976209948734%2F1148443641170362513%2Ffc.jpg?table=block&id=9b58f6dc-6f23-46ae-a801-13077b27312f&spaceId=2579cb2f-2b59-450e-ba2a-4bd4e5932e09&width=250&userId=&cache=v2)

<br />

## 📌 프로젝트 소개
- **프로젝트명**: 빈공간
- **프로젝트 주제**: 쉐어 오피스 등 공유 공간을 등록하고 예약할 수 있는 서비스 플랫폼
- **프로젝트 참여인원**: 15명
- **github 주소**: https://github.com/APPSCHOOL3-iOS/project03-teamD/
- **figma 주소** : https://www.figma.com/file/VnMrtBrUsG3W6tdOo8tmg3/D%ED%8C%80---%EA%B3%B5%EA%B0%84%EB%8C%80%EC%97%AC-APP?type=design&node-id=0-1&mode=design&t=ysR59nogBI6ScGaA-0
- **notion 주소**: https://tin-slug-eb7.notion.site/BinGongGan-9b58f6dc6f2346aea80113077b27312f

<br /><br />

#### 활용 기술
<img  src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white"><img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"><img src="https://img.shields.io/badge/xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white"><img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white"><img src="https://img.shields.io/badge/swift-F05138?style=for-the-badge&logo=swift&logoColor=white">

<br />

####  🤙🏻 컨벤션 & 규칙
```
-   feat : 새로운 기능 추가
-   fix : 버그 수정
-   docs : 문서 수정
-   style : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
-   refactor : 코드 리펙토링
-   test : 테스트 코드, 리펙토링 테스트 코드 추가
-   chore : 빌드 업무 수정, 패키지 매니저 수정
-   rename : 이름 변경
```

-----
<br />

### ⭐️ 빈공간 User 앱
- 테스트 계정:


##### 회원가입 & 로그인
- 회원가입은 Firebase Auth를 통해 인증할 수 있다.
- 회원가입에 필요한 항목은 유효성 검사를 진행한다.
- 이메일 중복검사를 통해 중복되지 않은 계정을 생성할 수 있다.
- 로그인 정보는 앱 내에 저장되어 자동로그인을 할 수 있다.


##### 지도 검색
- 빈공간 앱은 공간명을 검색할 수 있을 뿐만 아니라 지도로도 검색할 수 있다.
- 도로명 주소로 원하는 위치를 검색할 수 있다.
- 검색하게 되면 하단에 리스트들이 떠서 현재 예약 가능한 공간 목록을 볼 수 있다.
- 리스트 뿐만 아니라 지도 위에 핀을 누르게 되면 자세한 정보를 볼 수 있다.
- 하단 왼쪽에 현재 내 위치를 볼 수 있는 버튼이 있다. (내 주변 검색 가능)

##### 찜



##### 마이페이지
- 내정보에 대해 관리 할 수 있다.(회원정보,계좌관리,계정관리)
- 예약/리뷰 내역을 볼 수 있다.
- 고객센터를 통해 자주 묻는 질문 또는 1:1 문의(상담원 연결,이메일 문의)를 할수있다.
- 관리자가 등록한 앱 공지사항, 앱 정보를 볼 수 있다.
- 앱 설정(위치권한, 알림), 로그아웃을 할 수 있다.

|팀원|역할|
|:---:|:---:|
|방유빈(팀장)|리뷰,공지사항,1:1문의|
|손윤호|내정보,FAQ,로그아웃|
|조민근|예약내역|
---
<br />

### ⭐️ 빈공간 Biz 앱
- 테스트 계정:

##### 회원가입 & 로그인
- 회원가입은 Firebase Auth를 통해 인증할 수 있다.
- 회원가입에 필요한 항목은 유효성 검사를 진행한다.
- 이메일 중복검사를 통해 중복되지 않은 계정을 생성할 수 있다.
- 로그인 정보는 앱 내에 저장되어 자동로그인을 할 수 있다.

##### 홈
- 전체 메뉴를 통해 판매자용 앱에서 제공하는 주요 기능 6가지에 접근할 수 있다.
- 판매자가 소유한 대여 공간에 새롭게 들어온 예약을 바로 확인 및 승인할 수 있다.

##### 예약 관리
- 달력을 통해 전체적인 예약 현황과 날짜별 예약 내역에 대해 확인할 수 있다.
- 예약이 있는 날짜에는 날짜 위에 동그란 표시가 생기고, 날짜 아래에 예약 건수가 표시된다.
- 대기, 취소, 확정 내역을 분리하여 확인 및 관리할 수 있다.

##### 리뷰 관리
- 판매자가 소유한 대여 공간별 리뷰를 확인할 수 있다.
- 리뷰에 최대 1개의 댓글을 작성할 수 있다.
- 부적절한 리뷰에 대해서는 적절한 신고 사유를 선택하여 신고 가능하다.

##### 공지사항
- 판매자가 소유한 대여 공간별 공지사항을 관리할 수 있다.
- 공지를 특정 공간에만 올릴지, 소유한 전체 공간에 올릴지 선택할 수 있다.

##### 내 공간
- 판매자의 정보가 명함 형식으로 나타난다.
- 공간 등록을 하지 않은 경우, 공간 등록을 위한 버튼이 하단에 나타난다.
- 공간 등록을 한 경우, 세부 공간을 등록 및 관리할 수 있는 스크롤 뷰가 나타난다.

---
<br />

### ⭐️ 빈공간 관리자 앱
- 테스트 계정:
- 




