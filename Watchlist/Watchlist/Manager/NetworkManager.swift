//
//  NetworkManager.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import Foundation

struct constant {
    static let API_KEY = "3a132cd08cf31aa4eb0a0d1603070abc"
    static let baseURL = "https://api.themoviedb.org"
    static let imageURL = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"
}

public class NetworkManager {
    
    public static let shared = NetworkManager()
    
    func getApiData<T: Codable>(requestUrl: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, serviceResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(.success(result))
                }
                catch let error {
                    completionHandler(.failure(error))
                }
            }   
        }.resume()
    }
}
