//
//  NetworkManager.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/19/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func requestNetwork() {
        let urlString = APIKey.baseURL + "pblprfr"
        print(urlString)
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "service", value: APIKey.key),
            URLQueryItem(name: "stdate", value: "20240912"),
            URLQueryItem(name: "eddate", value: "20240912"),
            URLQueryItem(name: "cpage", value: "1"),
            URLQueryItem(name: "rows", value: "10"),
            URLQueryItem(name: "shcate", value: "AAA"),
        ]
        guard let url = urlComponents?.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("에러 발생")
                return
            }
            guard let data else {
                print("데이터 없음!")
                return
            }
            let parser = XMLPerformanceParser()
            parser.parse(data: data)
            
        }
        task.resume()
    }
}
