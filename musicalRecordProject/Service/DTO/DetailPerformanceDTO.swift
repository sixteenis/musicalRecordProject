//
//  DetailPerformanceDTO.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/19/24.
//

import Foundation

struct DetailPerformanceDTO {
    var mt20id: String
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
}

struct RelatedLink {
    var relatename: String
    var relateurl: String
}

class XMLDetailPerformanceParser: NSObject, XMLParserDelegate {
    
    private var currentElement = ""
    private var currentText = ""
    
    private var currentPerformance: DetailPerformanceDTO?
    private var currentRelatedLink: RelatedLink?
    private var styurls: [String] = []
    private var relates: [RelatedLink] = []
    
    private var performances: [DetailPerformanceDTO] = []
    
    // Parsing 시작
    func parse(data: Data) -> [DetailPerformanceDTO] {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        return performances
    }
    
    // XML의 새로운 엘리먼트 시작
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        currentText = ""
        
        if elementName == "db" {
            currentPerformance = DetailPerformanceDTO(
                mt20id: "",
                prfnm: "",
                prfpdfrom: "",
                prfpdto: "",
                fcltynm: "",
                prfcast: "",
                prfcrew: "",
                prfruntime: "",
                prfage: "",
                entrpsnm: "",
                pcseguidance: "",
                poster: "",
                area: "",
                genrenm: "",
                openrun: "",
                dtguidance: "",
                updatedate: "",
                prfstate: "",
                styurls: [],
                relates: []
            )
            styurls = []
            relates = []
        }
        
        if elementName == "relate" {
            currentRelatedLink = RelatedLink(relatename: "", relateurl: "")
        }
    }
    
    // XML의 엘리먼트 내용
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentText += string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // XML의 엘리먼트 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        guard var currentPerformance = currentPerformance else { return }
        
        switch elementName {
        case "mt20id": currentPerformance.mt20id = currentText
        case "prfnm": currentPerformance.prfnm = currentText
        case "prfpdfrom": currentPerformance.prfpdfrom = currentText
        case "prfpdto": currentPerformance.prfpdto = currentText
        case "fcltynm": currentPerformance.fcltynm = currentText
        case "prfcast": currentPerformance.prfcast = currentText
        case "prfcrew": currentPerformance.prfcrew = currentText
        case "prfruntime": currentPerformance.prfruntime = currentText
        case "prfage": currentPerformance.prfage = currentText
        case "entrpsnm": currentPerformance.entrpsnm = currentText
        case "pcseguidance": currentPerformance.pcseguidance = currentText
        case "poster": currentPerformance.poster = currentText
        case "area": currentPerformance.area = currentText
        case "genrenm": currentPerformance.genrenm = currentText
        case "openrun": currentPerformance.openrun = currentText
        case "dtguidance": currentPerformance.dtguidance = currentText
        case "updatedate": currentPerformance.updatedate = currentText
        case "prfstate": currentPerformance.prfstate = currentText
        
        case "styurl":
            styurls.append(currentText)
            
        case "relatenm":
            currentRelatedLink?.relatename = currentText
        case "relateurl":
            currentRelatedLink?.relateurl = currentText
            
        case "relate":
            if let relatedLink = currentRelatedLink {
                relates.append(relatedLink)
            }
            
        case "db":
            currentPerformance.styurls = styurls
            currentPerformance.relates = relates
            performances.append(currentPerformance)
        default:
            break
        }
    }
    
    // XML의 문서 끝
    func parserDidEndDocument(_ parser: XMLParser) {
        print("Parsing completed. \(performances.count) performances found.")
    }
    
    // 파싱 에러 처리
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("XML parsing error: \(parseError.localizedDescription)")
    }
}
