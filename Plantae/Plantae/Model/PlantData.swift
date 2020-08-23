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
    var photoData: String
    var creationDate: String
    var speciesName: String = ""
    var about: String = ""
    var link: String = ""

    init(commonName: String, name: String, photoData: String?) {
        let uuid = UUID().uuidString
        self.identifier = uuid
        self.commonName = commonName
        self.name = name

        if let data = photoData {
            self.photoData = data
        } else {
            self.photoData = ""
        }

        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        let today = formatter.string(from: currentDate)

        self.creationDate = today
        PlantData.serchForPlantInfo(plantID: uuid, commonName: commonName)
    }

    private static func serchForPlantInfo(plantID: String, commonName: String) {
        let caller = TrefleAPI()
        caller.updatePlantInfo(identifier: plantID, query: commonName)
    }
}
