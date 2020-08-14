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

    override func viewDidLoad() {
        super.viewDidLoad()
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let tabBarList = [homeController]

        viewControllers = tabBarList
    }

}
