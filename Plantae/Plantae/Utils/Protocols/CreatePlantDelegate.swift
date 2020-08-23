//
//  CreatePlantDelegate.swift
//  Plantae
//
//  Created by Pedro Sousa on 21/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

protocol CreatePlantDelegate: AnyObject {
    func updatePlants()
    func somethingWentWrong()
}
