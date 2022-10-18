//
//  SpokenLanguagesResponse.swift
//
//  Created by Tnluser on 01/09/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct SpokenLanguagesResponse: Codable {

    let englishName: String
    let iso6391: String
    let name: String

        enum CodingKeys: String, CodingKey {
            case englishName = "english_name"
            case iso6391 = "iso_639_1"
            case name
        }
}

extension SpokenLanguagesResponse: DomainConvertibleType {
    func asDomain() -> SpokenLanguagesEntity {
        return SpokenLanguagesEntity(
            iso6391: iso6391,
			name: name,
			englishName: englishName)
    }
}
