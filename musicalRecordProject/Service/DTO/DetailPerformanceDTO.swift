//
//  DetailPerformanceDTO.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/19/24.
//

import Foundation

// 공연 상세 정보를 담는 DTO
struct DetailPerformanceDTO {
    var mt20id: String
    var mt10id: String
    var prfnm: String
    var prfpdfrom: String
    var prfpdto: String
    var fcltynm: String
    var prfcast: String
    var prfcrew: String
    var prfruntime: String
    var prfage: String
    var entrpsnm: String
    var pcseguidance: String
    var poster: String
    var area: String
    var genrenm: String
    var openrun: String
    var dtguidance: String
    var updatedate: String
    var prfstate: String
    var styurls: [String]
    var relates: [RelatedLink]
    
    // DetailPerformance 모델로 변환
    func transformDetailModel() -> DetailPerformance {
        return DetailPerformance(
            placeId: mt10id,
            actors: prfcast,
            runtime: prfruntime,
            limitAge: prfage
        )
    }
}

// 관련 링크 정보를 담는 구조체
struct RelatedLink {
    var relatename: String
    var relateurl: String
}

// XML 파싱 클래스
class XMLDetailPerformanceParser: NSObject, XMLParserDelegate {
    private var currentElement = ""
    private var currentPerformance: DetailPerformanceDTO?
    
    // 임시 변수들
    private var mt20id = ""
    private var mt10id = ""
    private var prfnm = ""
    private var prfpdfrom = ""
    private var prfpdto = ""
    private var fcltynm = ""
    private var prfcast = ""
    private var prfcrew = ""
    private var prfruntime = ""
    private var prfage = ""
    private var entrpsnm = ""
    private var pcseguidance = ""
    private var poster = ""
    private var area = ""
    private var genrenm = ""
    private var openrun = ""
    private var dtguidance = ""
    private var updatedate = ""
    private var prfstate = ""
    
    // 배열로 파싱할 것들
    private var styurls: [String] = []
    private var relates: [RelatedLink] = []
    
    // 임시 변수들
    private var currentStyurl = ""
    private var currentRelateName = ""
    private var currentRelateUrl = ""

    // 파싱된 공연 데이터를 반환하는 변수
    var detailPerformance: DetailPerformanceDTO?
    
    // 파싱 시작
    func parserDidStartDocument(_ parser: XMLParser) {
        // 초기화
        mt20id = ""
        mt10id = ""
        prfnm = ""
        prfpdfrom = ""
        prfpdto = ""
        fcltynm = ""
        prfcast = ""
        prfcrew = ""
        prfruntime = ""
        prfage = ""
        entrpsnm = ""
        pcseguidance = ""
        poster = ""
        area = ""
        genrenm = ""
        openrun = ""
        dtguidance = ""
        updatedate = ""
        prfstate = ""
        styurls = []
        relates = []
    }
    
    // 새로운 요소를 발견했을 때 호출
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
    }

    // 요소의 내용을 처리
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !trimmedString.isEmpty {
            switch currentElement {
            case "mt20id": mt20id += trimmedString
            case "mt10id": mt10id += trimmedString
            case "prfnm": prfnm += trimmedString
            case "prfpdfrom": prfpdfrom += trimmedString
            case "prfpdto": prfpdto += trimmedString
            case "fcltynm": fcltynm += trimmedString
            case "prfcast": prfcast += trimmedString
            case "prfcrew": prfcrew += trimmedString
            case "prfruntime": prfruntime += trimmedString
            case "prfage": prfage += trimmedString
            case "entrpsnm": entrpsnm += trimmedString
            case "pcseguidance": pcseguidance += trimmedString
            case "poster": poster += trimmedString
            case "area": area += trimmedString
            case "genrenm": genrenm += trimmedString
            case "openrun": openrun += trimmedString
            case "dtguidance": dtguidance += trimmedString
            case "updatedate": updatedate += trimmedString
            case "prfstate": prfstate += trimmedString
            case "styurl": currentStyurl += trimmedString
            case "relatenm": currentRelateName += trimmedString
            case "relateurl": currentRelateUrl += trimmedString
            default: break
            }
        }
    }

    // 요소가 끝났을 때 호출
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "styurl" {
            styurls.append(currentStyurl)
            currentStyurl = ""
        } else if elementName == "relate" {
            let relate = RelatedLink(relatename: currentRelateName, relateurl: currentRelateUrl)
            relates.append(relate)
            currentRelateName = ""
            currentRelateUrl = ""
        } else if elementName == "db" {
            // 공연 상세 정보를 완성하고 단일 객체로 저장
            detailPerformance = DetailPerformanceDTO(
                mt20id: mt20id,
                mt10id: mt10id,
                prfnm: prfnm,
                prfpdfrom: prfpdfrom,
                prfpdto: prfpdto,
                fcltynm: fcltynm,
                prfcast: prfcast,
                prfcrew: prfcrew,
                prfruntime: prfruntime,
                prfage: prfage,
                entrpsnm: entrpsnm,
                pcseguidance: pcseguidance,
                poster: poster,
                area: area,
                genrenm: genrenm,
                openrun: openrun,
                dtguidance: dtguidance,
                updatedate: updatedate,
                prfstate: prfstate,
                styurls: styurls,
                relates: relates
            )
        }
    }

    // 파싱 완료
    func parserDidEndDocument(_ parser: XMLParser) {
        // 여기서 파싱 완료 후 추가 작업을 할 수 있습니다.
    }

    // 에러 발생 시 호출
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("파싱 에러: \(parseError.localizedDescription)")
    }
    
    // 파싱 시작 메서드
    func parse(data: Data) -> DetailPerformanceDTO? {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        return detailPerformance
    }
}
