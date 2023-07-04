//
//  WebService.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 03/07/23.
//



import Foundation

struct Webservice {
    
    func MatchDetailsAPICall(url:URL, completion : @escaping (MatchDetailsModel?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print(err)
            } else if let data = data {
                
                let resData = try? JSONDecoder().decode(MatchDetailsModel.self, from: data)
                
                if let resData = resData {
                    completion(resData)
                }
                
            } else {
                //                completion(nil)
            }
        }.resume()
    }
}

