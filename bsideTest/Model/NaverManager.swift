//
//  GeoManager.swift
//  bsideTest
//
//  Created by joomin on 3/22/24.
//

import Foundation

class NaverManager {
    let urlString = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=129.1133567,35.2982640&sourcecrs=epsg:4326&output=json&orders=legalcode"
    
    let clientID = "4fbq8lnxpt"
    let clientSecret = "nc40XPnBoYouVYGNtf2v4nuUAnMUqIOhxTvCXG6D"

    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            // URLRequest 생성
            var request = URLRequest(url: url)

            // 헤더에 데이터 추가
            request.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "X-NCP-APIGW-API-KEY-ID": clientID,
                "X-NCP-APIGW-API-KEY": clientSecret
            ]
            
            let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
                
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
        print(resultData)
        do {
            let decodedData = try decoder.decode(AddressData.self, from: resultData)
            var address : String? = "!"
            //받은 데이터를 전부 표기
            print(decodedData)
            
            return address
        }catch {
            print("parsing error")
            return nil
        }
    }
}
