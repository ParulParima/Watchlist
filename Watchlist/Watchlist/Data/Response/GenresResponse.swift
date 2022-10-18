//
//  GenresResponse.swift
//
//  Created by Tnluser on 01/09/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct GenresResponse: Codable {

	let name: String?
	let id: Int?

    init(from json: JSON) {
		name = json["name"].string
		id = json["id"].int
    }
}

extension GenresResponse: DomainConvertibleType {
    func asDomain() -> GenresEntity {
        return GenresEntity(
            name: name,
			id: id)
    }
}
