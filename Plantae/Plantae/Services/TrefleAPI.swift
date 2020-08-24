//
//  TrefleAPI.swift
//  Plantae
//
//  Created by Pedro Sousa on 19/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

class TrefleAPI {

    private let APIKey = "8bnHu9xQE-4MTA6HKAdS5BdI9F_nFlKYrFa9YPD-kWk"

    private func search(for query: String, completion: @escaping (_ response: [TrefleData]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "trefle.io"
        components.path = "/api/v1/plants/search"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "filter_not[common_name]", value: "null"),
            URLQueryItem(name: "token", value: APIKey)
        ]

        guard let url = components.url else {
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: { data, _, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion([])
                }
                if let data = data {
                    if let trefleResponse = try? JSONDecoder().decode(TrefleResponse.self, from: data) {
                        completion(trefleResponse.data)
                    } else {
                        print("Trefle response data decoding error")
                        completion([])
                    }
                }
            }
        )
        task.resume()
    }

    public func updatePlantInfo(identifier: String, query: String) {
        search(for: query, completion: { data in
            if data.count > 0 {
                let plantData = data[0]
                if var plant = DataManager.shared.getPlant(identifier: identifier) {
                    plant.link = plantData.links.linksSelf
                    plant.about = plantData.bibliography
                    plant.speciesName = plantData.scientificName
                    plant.commonName = plantData.commonName
                    do {
                        try DataManager.shared.updatePlant(plant: plant)
                    } catch {
                        print("Unable to update plant info")
                    }
                }
            }
        })
    }
}
