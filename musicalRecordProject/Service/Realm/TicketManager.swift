//
//  TicketManager.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/29/24.
//

import SwiftUI
import RealmSwift

final class TicketManager {
    private var realm = try! Realm()
    static let shared = TicketManager()
    private init() { }
    
    func addTicket(_ model: TicketMakeModel, imageData: Data) {
        let realmModel = TicketList(input: model)
        do {
            try self.realm.write {
                self.realm.add(realmModel)
                self.saveImageToDocument(imageData: imageData, filename: "\(realmModel.id)")
            }
            
        } catch {
            print("저장 실패 ㅜ")
        }
        
    }
    
}

// MARK: - 파일매니저 부분
private extension TicketManager {
    func saveImageToDocument(imageData: Data, filename: String) {
        guard let document = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else { return }
        let fileURL = document.appendingPathComponent("\(filename).jpg")
        do {
            try imageData.write(to: fileURL)
        } catch {
            print("file save error!!!!", error)
        }
    }
    func loadImageToDocument(filename: String) -> UIImage? {
        guard let document = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else { return nil}
        
        let fileURL = document.appendingPathComponent("\(filename).jpg")
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        } else {
            
            return UIImage(systemName: "star.fill")
        }
    }
    
    func removeImageFromDocument(filename: String) {
        guard let documentDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else { return }
        
        let fileURL = documentDirectory.appendingPathComponent("\(filename).jpg")
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
            } catch {
                print("file remove error", error)
            }
            
        } else {
            print("file no exist")
        }
        
    }
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Image download error: \(String(describing: error))")
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
    }
    func removeAllFilesInDocumentDirectory() {
        guard let documentDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else { return }
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
            for fileURL in fileURLs {
                try FileManager.default.removeItem(at: fileURL)
            }
            print("모든 파일이 삭제.")
        } catch {
            print("전체 파일 삭제 중 오류 발생: \(error)")
        }
    }
    
}
