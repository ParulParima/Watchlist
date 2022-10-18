//
//  CreatedByResponse.swift
//
//  Created by Tnluser on 01/09/22
//  Copyright © 2021 . All rights reserved.
//

import SwiftyJSON

struct CreatedByResponse: Codable {

	let creditId: String?
	let id: Int?
	let gender: Int?
	let name: String?
    let profilePath: String?

    init(from json: JSON) {
		creditId = json["credit_id"].string
		id = json["id"].int
		gender = json["gender"].int
		name = json["name"].string
        profilePath = json["profile_path"].string
    }
}

extension CreatedByResponse: DomainConvertibleType {
    func asDomain() -> CreatedByEntity {
        return CreatedByEntity(
            creditId: creditId,
			id: id,
			gender: gender,
			name: name,
            profilePath: profilePath)
    }
}
