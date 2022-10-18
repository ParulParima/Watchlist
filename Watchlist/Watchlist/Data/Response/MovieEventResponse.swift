//
//  BaseClassResponse.swift
//
//  Created by Tnluser on 02/09/22
//  Copyright © 2021 . All rights reserved.
//



struct MovieEventResponse: Codable {

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
	let genres: [GenresResponse]
	let originalTitle: String?
	let imdbId: String?
	let adult: Bool?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case runtime, id
        case popularity
        case tagline
        case originalLanguage = "original_language"
        case title
        case releaseDate = "release_date"
        case status, overview
        case genres
        case originalTitle = "original_title"
        case imdbId = "imdb_id"
        case adult
        }
}

extension MovieEventResponse: DomainConvertibleType {
    func asDomain() -> MovieEventEntity {
        return MovieEventEntity(
			posterPath: posterPath,
			runtime: runtime,
			id: id,
			popularity: popularity,
			tagline: tagline,
			originalLanguage: originalLanguage,
			title: title,
			releaseDate: releaseDate,
			status: status,
			overview: overview,
			genres: genres.map{ $0.asDomain() },
			originalTitle: originalTitle,
			imdbId: imdbId,
			adult: adult)
    }
}
