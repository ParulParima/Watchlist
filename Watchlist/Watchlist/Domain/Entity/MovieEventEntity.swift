//
//  MovieEventEntity.swift
//  Hope
//
//  Created by Tnluser on 02/09/22.
//

import Foundation

struct MovieEventEntity {

    let posterPath: String?
    let runtime: Int?
    let id: Int?
    let popularity: Double?
    let tagline: String?
    let originalLanguage: String?
    let title: String?
    let releaseDate: String?
    let status: String?
    let overview: String?
    let genres: [GenresEntity]
    let originalTitle: String?
    let imdbId: String?
    let adult: Bool?
}
