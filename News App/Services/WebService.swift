//
//  WebService.swift
//  News App
//
//  Created by Burak Donat on 24.03.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

class WebService {
    //fonksiyonun tamamlanmasini ve sonunda bir sey dondurmesini bekliyoruz.
    func performRequest(urlString: String, completion: @escaping (ArticleData?) -> Void){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                    completion(nil) //hata varsa hicbir veri dondurme.
                }else if let safeData = data {
                    if let data = self.parseJSON(safeData) {
                        completion(data)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ newsData: Data) -> ArticleData? {
        do {
            let decodedData = try JSONDecoder().decode(ArticleData.self, from: newsData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
