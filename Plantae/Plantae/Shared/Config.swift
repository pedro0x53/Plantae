//
//  Config.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class Config {
    public func mainController() -> UIViewController {
        let nav = UINavigationController(rootViewController: TabBarViewController())
        return nav
    }
}
