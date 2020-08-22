//
//  Config.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class Config {

    private let homeController = HomeViewController()
    private let myPlantsController = MyPlantsViewController()

    public func mainController() -> UIViewController {
        let tabBarController = TabBarViewController()

        let nav = UINavigationController(rootViewController: tabBarController)
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.isTranslucent = true
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.bottleGreen
        ]
        return nav
    }

    public func setupEnv() {
        do {
            deleteData()
            try DataManager.shared.setupFiles()
        } catch {
            fatalError("Failed to create main Folder and files")
        }
    }

    public func deleteData() {
        DataManager.shared.deleteData()
    }
}
