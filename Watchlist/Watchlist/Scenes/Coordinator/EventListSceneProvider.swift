//
//  EventListSceneProvider.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation

class EventListSceneProvider {
    let useCaseProvider: EventListUseCaseProvider
    
    init(useCaseProvider: EventListUseCaseProvider) {
        self.useCaseProvider = useCaseProvider
    }
}

extension EventListSceneProvider {
    
    func makeEventViewController() -> EventListViewController {
        let viewModel = EventListViewModel(useCase: useCaseProvider.fetchPopularMovieData())
        let controller: EventListViewController = .instanciate()
        controller.viewModel = viewModel
        return controller
    }
    
    func makeDetailViewController(id: String, eventType: EventType) -> DetailViewController {
        let viewModel = DetailViewModel(id: id, eventType: eventType, useCase: useCaseProvider.fetchTVEventDetails())
        let controller: DetailViewController = .instanciate()
        controller.viewModel = viewModel
        return controller
    }
    
    func makeSavedEventViewController(savedMovieEvent: [MovieEventEntity], savedTVEvent: [TVEventEntity]) -> SavedEventViewController {
        let viewModel = SavedEventViewModel(savedMovieEvent: savedMovieEvent, savedTVEvent: savedTVEvent)
        let controller: SavedEventViewController = .instanciate()
        controller.viewModel = viewModel
        return controller
    }
}
