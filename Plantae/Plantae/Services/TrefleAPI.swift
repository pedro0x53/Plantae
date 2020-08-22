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

    public func search(for query: String) {
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
            fatalError("Failed to create request")
        }

        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: { data, response, error in
                if let err = error {
                    fatalError("Search Error: \(err)")
                } else {
                    if let res = response {
                        print(res)
                    }
                    if let body = data {
                        print(body)
                    }
                }
            }
        )
        task.resume()
    }
//    public func getPlantInfo(query: String) -> PlantAPIData {
//
//    }
}
