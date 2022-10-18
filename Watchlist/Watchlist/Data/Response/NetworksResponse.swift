//
//  NetworksResponse.swift
//
//  Created by Tnluser on 01/09/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct NetworksResponse: Codable {

    let id: Int
    let name, logoPath, originCountry: String

        enum CodingKeys: String, CodingKey {
            case id, name
            case logoPath = "logo_path"
            case originCountry = "origin_country"
        }
}

extension NetworksResponse: DomainConvertibleType {
    func asDomain() -> NetworksEntity {
        return NetworksEntity(
            id: id,
            name: name,
            logoPath: logoPath,
            originCountry: originCountry)
    }
}
