//
//  DetailPerformanceDTO.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/19/24.
//

import Foundation

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
    
    func transformDetailModel() -> DetailPerformance {
        let model = DetailPerformance(placeId: self.mt10id, actors: self.prfcast, runtime: prfruntime, limitAge: self.prfage)
        return model
    }
}

struct RelatedLink {
    var relatename: String
    var relateurl: String
}

class XMLDetailPerformanceParser: NSObject, XMLParserDelegate {
    
    private var currentElement: String = ""
    private var currentText: String = ""
    
    private var currentPerformance: DetailPerformanceDTO?
    private var currentRelatedLink: RelatedLink?
    private var relatedLinks: [RelatedLink] = []
    
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
                mt10id: "",
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
            relatedLinks = []
        }
        
        if elementName == "related" {
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
        case "mt10id": currentPerformance.mt10id = currentText
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
            currentPerformance.styurls.append(currentText)
            
        case "relatename":
            currentRelatedLink?.relatename = currentText
        case "relateurl":
            currentRelatedLink?.relateurl = currentText
            
        case "related":
            if let relatedLink = currentRelatedLink {
                relatedLinks.append(relatedLink)
            }
            
        case "db":
            currentPerformance.relates = relatedLinks
            performances.append(currentPerformance)
            self.currentPerformance = nil
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
        print("XML 파싱 에러: \(parseError.localizedDescription)")
    }
}
