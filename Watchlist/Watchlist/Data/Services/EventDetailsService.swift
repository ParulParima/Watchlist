//
//  EventDetailService.swift
//  Hope
//
//  Created by Tnluser on 31/08/22.
//

import Foundation

class EventDetailsService: EventDetailsUseCase {
   
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchMovieEventDetails(id: String, completion: @escaping (Result<MovieEventEntity, Error>) -> Void) {
        guard let url = URL(string: "\(constant.baseURL)/3/movie/\(id)?api_key=\(constant.API_KEY)&language=en-US") else {return}
        networkManager.getApiData(requestUrl: url, completionHandler: { (result: Result<MovieEventResponse, Error>) in
                                completion(result.map { data in
                                    return data.asDomain()
                                })
                               })
    }
    func fetchTVEventDetails(id: String, completion: @escaping (Result<TVEventEntity, Error>) -> Void) {
        guard let url = URL(string: "\(constant.baseURL)/3/tv/\(id)?api_key=\(constant.API_KEY)&language=en-US") else {return}
        networkManager.getApiData(requestUrl: url, completionHandler: { (result: Result<TVEventResponse, Error>) in
                                completion(result.map { data in
                                    return data.asDomain()
                                })
                               })
    }
}
