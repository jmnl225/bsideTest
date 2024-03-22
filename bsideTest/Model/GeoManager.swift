//
//  GeoManager.swift
//  bsideTest
//
//  Created by joomin on 3/22/24.
//

import Foundation

class GeoManager {
    let urlString = "https://maps.googleapis.com/maps/api/geocode/json?latlng=37.5682392,127.1807255&key="
    
    let apiKey = "AIzaSyCWcSomk-sSkj_QjDIXANsombKz8b7Qbeg"

    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                
                if error != nil {
                    fatalError("data is nil")
                    return
                }
                
                if let safeData = data {
                    if let result = self.parseJSON(safeData) {
                        print(result)
                    }
                }
                
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ resultData: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Response.self, from: resultData)
            var address : String? = "!"
            //받은 데이터를 전부 표기
            print(decodedData)
            
             //해당 지역의 행정국가 표기
            for data in decodedData.results {
                address = data.formatted_address
            }
            
            return address
        }catch {
            print("parsing error")
            return nil
        }
    }
}
