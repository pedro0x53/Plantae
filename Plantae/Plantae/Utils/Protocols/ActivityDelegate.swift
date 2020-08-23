//
//  ActivityDelegate.swift
//  Plantae
//
//  Created by Pedro Sousa on 23/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

protocol ActivityDelegate: AnyObject {
    func updateCompletedActivity(identifier: String)
}
