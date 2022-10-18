//
//  EventListViewModel.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import Foundation

final class EventListViewModel {
    var title = "Events"
    
    let useCase: EventListUseCase
    var eventType: EventType = .movie
    
    var popularData:[ResultsEntity] = [ResultsEntity]()
    var reloadPopularMovieData = ObservableProperty(value: false)
    var reloadPopularTVData = ObservableProperty(value: false)
    
    init(useCase: EventListUseCase) {
        self.useCase = useCase
    }
    
    
    func viewLoaded() {
        self.popularData = [ResultsEntity]()
        if self.eventType == .movie {
            fetchPopularMovieData()
        }
        else {
            fetchPopularTvData()
        }
    }
    func fetchMovieEvent() {
        fetchPopularMovieData()
        self.eventType = .movie
    }
    func fetchTVEvent() {
        fetchPopularTvData()
        self.eventType = .tv
    }
    
    func fetchPopularMovieData() {
        useCase.fetchPopularMovieData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.popularData = response.results
                self.reloadPopularMovieData.value = true
            case let .failure(error):
                print(error)            
            }
        }
}
    func fetchPopularTvData() {
        useCase.fetchPopularTVData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.popularData = response.results
                self.reloadPopularTVData.value = true
            case let .failure(error):
                print(error)
            }
        }
}
    
}


