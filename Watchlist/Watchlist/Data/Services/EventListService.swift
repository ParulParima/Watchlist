//
//  EventListService.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation


class EventListService {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
}

extension EventListService : EventListUseCase  {
    func fetchPopularMovieData(completion: @escaping (Result<TrendingEntity, Error>) -> Void) {
        guard let url = URL(string: "\(constant.baseURL)/3/trending/movie/day?api_key=\(constant.API_KEY)") else {return}
        networkManager.getApiData(requestUrl: url, completionHandler: { (result: Result<TrendingResponse, Error>) in
                                completion(result.map { data in
                                    return data.asDomain()
                                })
                               })
    }
        func fetchPopularTVData(completion: @escaping (Result<TrendingEntity, Error>) -> Void) {
            guard let url = URL(string: "\(constant.baseURL)/3/trending/tv/day?api_key=\(constant.API_KEY)") else {return}
            networkManager.getApiData(requestUrl: url, completionHandler: { (result: Result<TrendingResponse, Error>) in
                                    completion(result.map { data in
                                            return data.asDomain()
                                    })
                                   })
        }
}
        
