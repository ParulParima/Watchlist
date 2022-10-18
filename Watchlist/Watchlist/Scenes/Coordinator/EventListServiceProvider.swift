//
//  File.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation


class EventListServiceProvider: EventListUseCaseProvider {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }    
}

extension EventListServiceProvider {
    func fetchPopularMovieData() -> EventListUseCase {
        return EventListService.init(networkManager: networkManager)
    }
    
    func fetchPopularTVData() -> EventListUseCase {
        return EventListService.init(networkManager: networkManager) 
    }
    func fetchMovieEventDetails() -> EventDetailsUseCase {
        return EventDetailsService.init(networkManager: networkManager)
    }
    func fetchTVEventDetails() -> EventDetailsUseCase {
        return EventDetailsService.init(networkManager: networkManager)
    }
}
