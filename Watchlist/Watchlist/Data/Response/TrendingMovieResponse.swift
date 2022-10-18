//
//  TrendingMovieResponse.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import Foundation


struct TrendingResponse: Codable {

    let totalPages: Int
    let page: Int
    let totalResults: Int
    let results: [ResultResponse]
    
    enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }

}

extension TrendingResponse: DomainConvertibleType {
    func asDomain() -> TrendingEntity {
        return TrendingEntity(
            totalPages: totalPages,
            page: page,
            totalResults: totalResults,
            results: results.map{ $0.asDomain() })
    }
}
