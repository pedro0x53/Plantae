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
        let nav = setupNavController()
        return nav
    }

    private func setupNavController() -> UINavigationController {
        let nav = UINavigationController(rootViewController: TabBarViewController())
        nav.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .regular)]
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        return nav
    }

}
