//
//  TrefleData.swift
//  Plantae
//
//  Created by Pedro Sousa on 19/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

// MARK: - Trefle Response
struct TrefleResponse: Codable {
    let data: [PlantAPIData]
}

// MARK: - Plant API DAta
struct PlantAPIData: Codable {
    let identifier: Int
    let commonName, slug, scientificName: String
    let year: Int
    let bibliography, author, status, rank: String
    let familyCommonName: String?
    let genusID: Int
    let imageURL: String
    let synonyms: [String]
    let genus, family: String
    let links: Links

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case commonName = "common_name"
        case slug
        case scientificName = "scientific_name"
        case year, bibliography, author, status, rank
        case familyCommonName = "family_common_name"
        case genusID = "genus_id"
        case imageURL = "image_url"
        case synonyms, genus, family, links
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, plant, genus: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case plant, genus
    }
}
