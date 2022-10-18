//
//  EventDetailsUseCase.swift
//  Hope
//
//  Created by Tnluser on 31/08/22.
//

import Foundation

protocol EventDetailsUseCase {
    func fetchMovieEventDetails(id: String, completion: @escaping (Result<MovieEventEntity, Error>) -> Void)
    func fetchTVEventDetails(id: String, completion: @escaping (Result<TVEventEntity, Error>) -> Void)
}
