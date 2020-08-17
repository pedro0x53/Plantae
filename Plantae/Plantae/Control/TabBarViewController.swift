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
    private let mypPlantsController = MyPlantsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        mypPlantsController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

        let nav = UINavigationController(rootViewController: mypPlantsController)

        let tabBarList = [homeController, nav]

        viewControllers = tabBarList
    }

}
