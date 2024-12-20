# 🎭  내 안의 연뮤
"실시간 공연을 살펴보고, 관람한 공연을 후기와 함께 기록해 보세요!"
<br>

## 📱 **주요 기능**
<div style="text-align: center;", align="center">
    <table style="margin: 0 auto; text-align: center;">
        <tr>
            <th style="padding: 10px;">홈</th>
            <th style="padding: 10px;">공연 상세</th>
            <th style="padding: 10px;">티켓보관함</th>
            <th style="padding: 10px;">설정</th>
        </tr>
        <tr>
            <td style="text-align: center;">
                <img src="https://github.com/user-attachments/assets/c3c10236-e11b-48da-a82e-a81f2e4690b5" width="150" />
            </td>
            <td style="text-align: center;">
                <img src="https://github.com/user-attachments/assets/606b5a71-71ed-4980-8e7d-89682b79f440" width="150" />
            </td>
            <td style="text-align: center;">
                <img src="https://github.com/user-attachments/assets/450a58dc-8468-4d79-8822-2bef8e58fe02" width="150" />
            </td>
            <td style="text-align: center;">
                <img src="https://github.com/user-attachments/assets/44a2fcf0-bb93-4c88-a6e8-e2f04677bbdb" width="150" />
            </td>
        </tr>
    </table>
</div>


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
- `URLSession` + `Concurrency` +  `XML Parser`
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
### Card-flip Animation 활용 Custom 티켓 뷰 구현
- rotation3DEffect, scaleEffect 메서드를 활용하여 티켓 UI 구현
- animation 메서드를 활용하여 전환 시 자연스러운 애니메이션 구현

### FirebaseCashlytics 
- 앱의 안전성과 런타임 중 발생하는 크래시, 오류를 실시간으로 모니터링 진행하여 사용자 경험과 빠른 문제 해결


<br>    

## 🚨 트러블 슈팅
### 런타임 시 과도한 메모리 사용
<div style="text-align: center;", align="center">
    <table style="margin: 0 auto; text-align: center;">
        <tr>
            <th style="padding: 10px;">해결전 메모리</th>
            <th style="padding: 10px;">해결후 메모리</th>
            <th style="padding: 10px;">해결전 이미지용량</th>
            <th style="padding: 10px;">해결후 이미지용량</th>
        </tr>
        <tr>
            <td style="text-align: center;">
                <img width="120" alt="스크린샷 2024-11-08 15 29 20" src="https://github.com/user-attachments/assets/4f1ecfec-ee59-48b4-b195-fb995268fc3e">
            </td>
            <td style="text-align: center;">
                <img width="120" alt="스크린샷 2024-11-08 15 29 38" src="https://github.com/user-attachments/assets/2a964cac-59d6-4a9a-a17d-aa3736376cab">
            </td>
            <td style="text-align: center;">
                <img width="300" alt="스크린샷 2024-11-08 17 37 18" src="https://github.com/user-attachments/assets/edafc550-95d1-40c4-abef-c78fbe77b52e">
            </td>
            <td style="text-align: center;">
                <img width="300" alt="스크린샷 2024-11-08 17 44 16" src="https://github.com/user-attachments/assets/fd7ceb9d-c910-4467-8fad-f5c8cbb59e2e">
            </td>
        </tr>
    </table>
</div>

- 문제 🤔
    - 디버깅을 통해 공연 정보 API에서 앱에 맞지 않는 용량의 이미지를 전달해주고 있다는 문제로 인해 과도한 메모리를 사용 중인 것을 확인

- 해결 🫢
    - Image resizing과 앱에 필요한 적합한 사이즈로 downSampling을 진행하여 이전 이미지 용량 대비 90% 감소한 용량 사용
  
  
