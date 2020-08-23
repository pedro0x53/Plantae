//
//  MyPlantsViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 15/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class MyPlantsViewController: UIViewController {

    private let myPlants = MyPlants()
    private var plants: [PlantData] = DataManager.shared.getAllPlants()

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func loadView() {
        super.loadView()
        self.view = myPlants
        myPlants.plantsCollection.delegate = self
        myPlants.plantsCollection.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupNavBar() {
        self.tabBarController?.navigationItem.title = "My Plants"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(newPlant))
        self.tabBarController?.navigationItem.rightBarButtonItem?.tintColor = .bottleGreen
    }

    @objc private func newPlant() {
        let createPlantVC = CreatePlantViewController()
        createPlantVC.delegate = self
        let nav = UINavigationController(rootViewController: createPlantVC)
        self.present(nav, animated: true, completion: nil)
    }
}

extension MyPlantsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if plants.count > 0 {
            myPlants.imageView.removeFromSuperview()
        }
        return plants.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantCell.identifier,
                                                            for: indexPath) as? PlantCell
        else {
            fatalError("Unable to cast cell PlantCell to UICollectionCell")
        }
        cell.configure(data: plants[indexPath.row])
        return cell
    }
}

extension MyPlantsViewController: CreatePlantDelegate {
    func updatePlants() {
        self.plants = DataManager.shared.getAllPlants()
        myPlants.plantsCollection.reloadData()
    }

    func somethingWentWrong() {
        print("Something went wrong")
    }
}
