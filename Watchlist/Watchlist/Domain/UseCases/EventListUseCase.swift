//
//  EventListUseCase.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation

protocol EventListUseCase{
    func  fetchPopularMovieData(completion: @escaping(Result<TrendingEntity, Error>) -> Void)
    func  fetchPopularTVData(completion: @escaping(Result<TrendingEntity, Error>) -> Void)
}
