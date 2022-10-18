//
//  ResultsResponse.swift
//
//  Created by Tnluser on 29/08/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct ResultResponse: Codable {

    let backdropPath: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String
    let posterPath: String?
    let mediaType: String
    let genreIDS: [Int]
    let releaseDate: String?
    let name, originalName, firstAirDate: String?

        enum CodingKeys: String, CodingKey {
            case backdropPath = "backdrop_path"
            case id, title
            case originalTitle = "original_title"
            case overview
            case posterPath = "poster_path"
            case mediaType = "media_type"
            case genreIDS = "genre_ids"
            case releaseDate = "release_date"
            case name
            case originalName = "original_name"
            case firstAirDate = "first_air_date"
        }
    }


extension ResultResponse: DomainConvertibleType {
    func asDomain() -> ResultsEntity {
        return ResultsEntity(backdropPath: backdropPath, id: id, title: title, originalTitle: originalTitle, overview: overview, posterPath: posterPath, mediaType: mediaType, genreIDS: genreIDS, releaseDate: releaseDate, name: name, originalName: originalName, firstAirDate: firstAirDate
            )
    }
}
