//
//  EventListUseCaseProvider.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation

protocol EventListUseCaseProvider {
    func fetchPopularMovieData() -> EventListUseCase
    func fetchPopularTVData() -> EventListUseCase
    func fetchMovieEventDetails() -> EventDetailsUseCase
    func fetchTVEventDetails() -> EventDetailsUseCase
}
