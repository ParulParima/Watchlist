//
//  TVEventEntity.swift
//  Hope
//
//  Created by Tnluser on 01/09/22.
//

import Foundation

struct TVEventEntity {

    let adult: Bool?
    let createdBy: [CreatedByEntity]
    let episodeRunTime: [Int]
    let firstAirDate: String?
    let genres: [GenresEntity]
    let id: Int?
    let inProduction: Bool?
    let languages: [String]
    let lastAirDate: String?
    let name: String?
    let networks: [NetworksEntity]
    let numberOfEpisodes, numberOfSeasons: Int?
    let originCountry: [String]
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let seasons: [SeasonsEntity]
    let spokenLanguages: [SpokenLanguagesEntity]
    let status, tagline, type: String?

}
