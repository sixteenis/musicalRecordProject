//
//  DetailPerformanceView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/26/24.
//

import SwiftUI
import Kingfisher
struct DetailPerformanceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showDetail = false
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
        .navigationTitle("냠")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("누름")
                } label: {
                   Text("기록")
                }
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
                .font(.title2)
                .bold()
            performancInfo()
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
    func performancInfo() -> some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("공연기간")
                    .asForeground(Color.asGrayFont)
                Text("2024.07.12~2024.10.13")
                Spacer()
                    .frame(height: 20)
                Text("공연장소")
                    .asForeground(Color.asGrayFont)
                Text("충무아트센터 대극장")
            }
            Spacer()
                .frame(width: 10)
            Rectangle()
                .frame(width: 1)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text("관람 연령")
                    .asForeground(Color.asGrayFont)
                Text("12세 이상")
                Spacer()
                    .frame(height: 20)
                Text("러닝 타임")
                    .asForeground(Color.asGrayFont)
                Text("120분")
            }
        } //:HSTACK
        
    }
    
}
private extension DetailPerformanceView {
    func actorInfo() -> some View {
        VStack(alignment: .leading) {
            Text("배우,제작진 정보")
                .font(.title2)
                .bold()
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
                .font(.title3)
                .bold()
            HStack {
                Text("박성민, 임수민, 냠냠이, 킁킁ㅁ;ㅣㄴ아리ㅏㅁ넝리ㅏ먼이ㅏ럼ㄴ아ㅣ러이")
                    .lineLimit(1)
                Spacer()
                Button {
                    // Action
                    showDetail.toggle()
                } label: {
                    Text("더보기")
                }
            }
                
        }
    }
    func detailActorsInfor() -> some View {
        VStack(alignment: .leading) {
            Text("배우")
                .font(.title3)
                .bold()
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
                .font(.title2)
                .bold()
            Text("판매처")
                .font(.title3)
                .bold()
            Image(systemName: "star")
            Text("티켓 금액")
                .font(.title3)
                .bold()
            Text("1000억원")
                .font(.title)
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
#Preview {
    DetailPerformanceView()
}




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
