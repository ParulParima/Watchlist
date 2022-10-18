//
//  DetailViewModel.swift
//  Hope
//
//  Created by Tnluser on 31/08/22.
//

import Foundation

final class DetailViewModel {
    
    let useCase: EventDetailsUseCase
    var reloadData = ObservableProperty(value: false)
    var TVeventDetails: TVEventEntity?
    var MovieEventDetails: MovieEventEntity?
    
    var id: String
    var eventType: EventType
    
    init(id: String, eventType: EventType, useCase: EventDetailsUseCase) {
        self.id = id
        self.useCase = useCase
        self.eventType = eventType
    }
    
    func viewLoaded() {
        if self.eventType == .movie {
            fetchMovieEventDetails()
        }
        else {
            fetchTVEventDetails()
        }
    }
    
    func fetchTVEventDetails() {
        useCase.fetchTVEventDetails(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.TVeventDetails = response
                debugPrint(self.TVeventDetails as Any)
                self.reloadData.value = true
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func fetchMovieEventDetails() {
        useCase.fetchMovieEventDetails(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.MovieEventDetails = response
                debugPrint(self.MovieEventDetails as Any)
                self.reloadData.value = true
            case let .failure(error):
                print(error)
            }
        }
    }
}


