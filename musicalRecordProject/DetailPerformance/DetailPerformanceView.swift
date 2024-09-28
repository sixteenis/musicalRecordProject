//
//  DetailPerformanceView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/26/24.
//

import SwiftUI
import Kingfisher
struct DetailPerformanceView: View {
    @State private var showNextView = false
    @State private var showDetail = false
    var data: DetailPerformance = DetailPerformance()
    
    var tab: MainView
    var body: some View {
        ScrollView {
            postView(80)
            Divider()
            postInfo()
            Divider()
            actorInfo()
            Divider()
            ticketInfo()
            Divider()
            inforPost()
        }
        .navigationTitle(data.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Action
                    showNextView = true
                } label: {
                    Image.ticketPlus
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .background(
                    NavigationLink(destination: TicketMakeView(), isActive: $showNextView) {
                        EmptyView() // 실제 링크를 표시하지 않음
                    }
                )
                
            }
        }
        .onAppear {
            tab.tabBarVisibility = .hidden
            print(data)
        }
        .onDisappear {
            if !showNextView {
                tab.tabBarVisibility = .visible
            }
        }
        
        
        
    }
    
}
private extension DetailPerformanceView {
}
// MARK: - 작품정보 부분
private extension DetailPerformanceView {
    func postInfo() -> some View {
        VStack(alignment: .leading) {
            Text("작품정보")
                .font(.boldFont18)
            performancInfo()
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
    func performancInfo() -> some View {
        HStack() {
            VStack(alignment: .leading) {
                performancInfoText(main: "공연기간", content: "2024.07.13 ~ 08.15")
                performancInfoText(main: "공연장소", content: "충무아트센터 대극장")
            }
            Spacer()
                .frame(width: 10)
            Rectangle()
                .frame(width: 1, height: 100)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                performancInfoText(main: "관람 연령", content: "12세 이상")
                performancInfoText(main: "러닝 타임", content: "120분")
            }
            
        } //:HSTACK
        
        
    }
    func performancInfoText(main: String, content: String) -> some View {
        VStack(alignment: .leading) {
            Text(main)
                .asForeground(Color.asGrayFont)
                .font(.font16)
            Spacer()
                .frame(height: 10)
            Text(content)
                .font(.boldFont14)
            Spacer()
                .frame(height: 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}
private extension DetailPerformanceView {
    func actorInfo() -> some View {
        VStack(alignment: .leading) {
            Text("배우,제작진 정보")
                .font(.boldFont18)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 10)
            actorsTitle()
        }
        .padding(.horizontal)
    }
    @ViewBuilder
    func actorsTitle() -> some View {
        if showDetail {
            detailActorsInfor()
        } else {
            simpleActorsInfor()
        }
        
    }
    func simpleActorsInfor() -> some View {
        VStack(alignment: .leading) {
            Text("배우")
                .font(.font16)
            HStack {
                Text("박성민, 임수민, 냠냠이, 킁킁ㅁ;ㅣㄴ아리ㅏㅁ넝리ㅏ먼이ㅏ럼ㄴ아ㅣ러이")
                    .lineLimit(1)
                    .font(.font14)
                Spacer()
                Button {
                    // Action
                    showDetail.toggle()
                } label: {
                    Text("더보기")
                        .asForeground(.font)
                        .font(.boldFont15)
                }
            }
            
        }
    }
    func detailActorsInfor() -> some View {
        VStack(alignment: .leading) {
            Text("배우")
                .font(.font16)
            Text("박성민, 임수민, 냠냠이, 킁킁ㅁ;ㅣㄴ아리ㅏㅁ넝리ㅏ먼이ㅏ럼ㄴ아ㅣ러이")
            Spacer()
                .frame(height: 10)
            Text("제작진")
                .font(.title3)
                .bold()
            Text("머머머 어쩌구 저쩌구")
            Text("제작사")
                .font(.title3)
                .bold()
            Text("머머머 어쩌구 저쩌구")
            Text("기획사")
                .font(.title3)
                .bold()
            Text("머머머 어쩌구 저쩌구")
            
        }
    }
}
private extension DetailPerformanceView {
    func ticketInfo() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("티켓 정보")
                .font(.boldFont18)
            Text("판매처")
                .font(.font16)
            Image(systemName: "star")
            Text("티켓 금액")
                .font(.font16)
            Text("1000억원")
                .font(.font14)
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        
    }
}
// MARK: - 소개 포스트 부분
private extension DetailPerformanceView {
    func postView(_ size: CGFloat) -> some View {
        VStack {
            Image.exPost
                .resizable()
                .frame(width: size * 2, height: size * 3)
            Spacer()
                .frame(height: 15)
            Capsule()
                .frame(width: 80, height: 30)
                .asForeground(.green)
                .overlay {
                    Text("공연중")
                }
            Text("정의의 여인들")
                .font(.title2)
                .fontWeight(.semibold)
                .asForeground(.asBlack)
        }
    }
    
    @MainActor func inforPost() -> some View {
        VStack(spacing: 0) {
            KFImage(URL(string: "http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF248302_240903_1144300.jpg"))
                .placeholder { //플레이스 홀더 설정
                    Image.postPlaceholder
                }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                .resizable()
                .aspectRatio(contentMode: .fill)
            KFImage(URL(string: "http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF248302_240903_1144300.jpg"))
                .placeholder { //플레이스 홀더 설정
                    Image.postPlaceholder
                }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .padding(.horizontal, 10)
    }
    
}
//#Preview {
//    DetailPerformanceView(tab: MainView())
//}




// MARK: - 예정
//private extension DetailPerformanceView {
//    @MainActor func DetailInforImage() -> some View {
//        VStack(spacing: 0) {
//            VStack {
//                KFImage(URL(string: "http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF248302_240903_1144300.jpg"))
//                    .placeholder { //플레이스 홀더 설정
//                        Image.postPlaceholder
//                    }.retry(maxCount: 3, interval: .seconds(5)) //재시도
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                KFImage(URL(string: "http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF248302_240903_1144300.jpg"))
//                    .placeholder { //플레이스 홀더 설정
//                        Image.postPlaceholder
//                    }.retry(maxCount: 3, interval: .seconds(5)) //재시도
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//            }
//            .frame(height: postImageShowDetail ? UIScreen.main.bounds.height  : 200, alignment: .top)
//            .clipped()
//            .padding(.horizontal, 10)
//            Rectangle()
//                .frame(maxWidth: .infinity)
//                .padding(.horizontal, 10)
//                .frame(height: 40)
//                .opacity(0.7)
//                .asForeground(Color.asBackground)
//                .asForeground(.asBackground)
//                .wrapToButton {
//                    self.postImageShowDetail.toggle()
//                }
//                .overlay {
//                    if postImageShowDetail {
//                        Image.upImage
//                    } else {
//                        Image.downImage
//                    }
//                }
//        }
//
//    }
//}
