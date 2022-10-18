//
//  BaseClassResponse.swift
//
//  Created by Tnluser on 01/09/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct TVEventResponse: Codable {

    let adult: Bool?
    let createdBy: [CreatedByResponse]
    let episodeRunTime: [Int]
    let firstAirDate: String?
    let genres: [GenresResponse]
    let id: Int
    let inProduction: Bool?
    let languages: [String]
    let lastAirDate: String?
    let name: String?
    let networks: [NetworksResponse]
    let numberOfEpisodes, numberOfSeasons: Int?
    let originCountry: [String]
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let seasons: [SeasonsResponse]
    let spokenLanguages: [SpokenLanguagesResponse]
    let status, tagline, type: String?

        enum CodingKeys: String, CodingKey {
            case adult
            case createdBy = "created_by"
            case episodeRunTime = "episode_run_time"
            case firstAirDate = "first_air_date"
            case genres, id
            case inProduction = "in_production"
            case languages
            case lastAirDate = "last_air_date"
            case name
            case networks
            case numberOfEpisodes = "number_of_episodes"
            case numberOfSeasons = "number_of_seasons"
            case originCountry = "origin_country"
            case originalLanguage = "original_language"
            case originalName = "original_name"
            case overview, popularity
            case posterPath = "poster_path"
            case seasons
            case spokenLanguages = "spoken_languages"
            case status, tagline, type
        }
}

extension TVEventResponse: DomainConvertibleType {
    func asDomain() -> TVEventEntity {
        return TVEventEntity(
            adult: adult,
            createdBy: createdBy.map{ $0.asDomain() },
            episodeRunTime: episodeRunTime,
            firstAirDate: firstAirDate,
            genres: genres.map{ $0.asDomain() },
            id: id,
            inProduction: inProduction,
            languages: languages,
            lastAirDate: lastAirDate,
            name: name,
            networks: networks.map{ $0.asDomain() },
            numberOfEpisodes: numberOfEpisodes,
            numberOfSeasons: numberOfSeasons,
            originCountry: originCountry,
            originalLanguage: originalLanguage,
            originalName: originalName,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            seasons: seasons.map{ $0.asDomain() },
            spokenLanguages: spokenLanguages.map{ $0.asDomain() },
            status: status,
            tagline: tagline,
            type: type )
    }
}
