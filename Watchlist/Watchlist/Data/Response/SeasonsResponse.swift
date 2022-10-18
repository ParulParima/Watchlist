//
//  SeasonsResponse.swift
//
//  Created by Tnluser on 01/09/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct SeasonsResponse: Codable {

    let airDate: String?
    let episodeCount: Int?
    let id: Int?
    let name, overview: String?
    let seasonNumber: Int?

        enum CodingKeys: String, CodingKey {
            case airDate = "air_date"
            case episodeCount = "episode_count"
            case id, name, overview
            case seasonNumber = "season_number"
        }
    }

extension SeasonsResponse: DomainConvertibleType {
    func asDomain() -> SeasonsEntity {
        return SeasonsEntity(
            airDate: name,
            episodeCount: id,
            id: episodeCount,
            name: overview,
            overview: airDate,
			seasonNumber: seasonNumber)
    }
}
