# 🎭  내 안의 연뮤
"실시간 공연을 살펴보고, 관람한 공연을 후기와 함께 기록해 보세요!"
<br>

## 📱 **주요 기능**
| 홈 | 티켓보관함 | 설정 |
|---------------|---------------|---------------|

> 🔥 날마다 진행 중인 공연 조회
    
> 🔍 날짜/제목 검색으로 공연 조회 
    
> 👀 공연 상세 정보 확인

> ✍️ 공연 기록 하기

> 👀 티켓 모양으로 본 공연 저장

> 🔔  예정 중인 공연 당일 알람 제공
    
    
  
<br>


## 💻 개발 환경
<p align="left">
<img src ="https://img.shields.io/badge/Swift-5.10-ff69b4">
<img src ="https://img.shields.io/badge/Xcode-15.4-blue">
<img src ="https://img.shields.io/badge/iOS-16.0+-orange">
<br>
    
- **기간**: 2024.09.10 ~ 2024.10.02 (**약 4주**)
- **인원**: iOS 1명

    
<br> 

## 🔧 아키텍처 및 기술 스택

- `SwiftUI` / `Combine`/ `MapKit`
- `MVVM` + `InOut Pattern` 
- `URLSeeion` + `Concurrency` +  `XML Parser`
- `Realm`/`UserDefault`
- `FirebaseCashlytics`  
- `Kingfisher`/  `Cosmos`
    
<br>    


## 🧰 프로젝트 주요 기술 사항
###  프로젝트 아키텍처

> MVVM + InOut  + RxSwift
    
- Combine InOut Pattern을 통한 양방향 데이터 바인딩으로 프로젝트 데이터 흐름 일원화
- associatedtype 형식의 Protocol 채택을 통한 프로젝트 구조의 명시적 정의
- ViewModifier을 사용하여 iOS 버전에 따른 분기 처리와 공통된 UI의 구성 요소를 캡슐화 및 재사용성 향상

<br>

> Concurrency + XML Parser + URLSeeion
- Concurrency를 통해 에러 처리와 가독성 향상과 Data Race 문제 발생 방지
- XML Parser를 사용하여 네트워크 응답 데이터 파싱 진행
- 파싱 이후 DTO(Data Transfer Object)로 매핑을 진행하여 데이터 의존성 최소화 및 네트워크 계층과 뷰 계층 간의 결합도를 최소화 진행
    
    
---
### FirebaseCashlytics 
- 앱의 안전성과 런타임 중 발생하는 크래시, 오류를 실시간으로 모니터링 진행하여 사용자 경험과 빠른 문제 해결
  
(추후 추가예정)
<br>    

## 🚨 트러블 슈팅 (공사중)
### 런타임 시 과도한 메모리 사용하는 문제

