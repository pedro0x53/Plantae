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
    var photoURL: String
    var creationDate: String
    var about: String
    var link: String

    init(commomName: String, name: String = "", photoURL: String = "") {
        self.identifier = UUID().uuidString

        if name.isEmpty {
            self.name = commomName
        } else {
            self.name = name
        }

        self.commonName = commomName
        self.photoURL = photoURL

        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        let today = formatter.string(from: currentDate)

        self.creationDate = today

        if commomName.isEmpty {
            self.speciesName = ""
            self.about = ""
            self.link = ""
        } else {
            self.speciesName = ""
            self.about = ""
            self.link = ""
        }
    }
}
