//
//  TabBarViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    private let homeController = HomeViewController()
    private let myPlantsController = MyPlantsViewController()
    private let plantController = PlantViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        myPlantsController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        plantController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)

        let nav = UINavigationController(rootViewController: myPlantsController)

        let tabBarList = [homeController, nav, plantController]

        viewControllers = tabBarList
    }

}
