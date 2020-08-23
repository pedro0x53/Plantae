//
//  PlantData.swift
//  Plantae
//
//  Created by Pedro Sousa on 20/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

struct PlantsArray: Codable {
    let plants: [PlantData]
}

// MARK: - Plant Local Data
struct PlantData: Codable {
    var identifier: String
    var name: String
    var commonName: String
    var speciesName: String
    var photoData: String
    var creationDate: String
    var about: String
    var link: String

    init(commonName: String, name: String = "", photoData: String?) {
        self.identifier = UUID().uuidString

        if commonName.isEmpty {
            self.commonName = "Arcanum Plant"
            self.speciesName = "Arcanum Plant"
            self.about = ""
            self.link = ""
        } else {
            self.commonName = commonName
            self.speciesName = commonName
            self.about = ""
            self.link = ""
        }

        if name.isEmpty {
            self.name = "Arcanum"
        } else {
            self.name = name
        }

        if let data = photoData {
            self.photoData = data
        } else {
            self.photoData = ""
        }

        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        let today = formatter.string(from: currentDate)

        self.creationDate = today
    }
}
