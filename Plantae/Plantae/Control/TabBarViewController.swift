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
    private let createPlantController = CreatePlantViewController()
    private let plantController = PlantViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .illuminatingEmerald

        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), tag: 0)
        myPlantsController.tabBarItem = UITabBarItem(title: "My Plants", image: UIImage(named: "plant_icon"), tag: 1)

        let nav = UINavigationController(rootViewController: myPlantsController)

        let tabBarList = [homeController, nav]

        viewControllers = tabBarList
    }

}
