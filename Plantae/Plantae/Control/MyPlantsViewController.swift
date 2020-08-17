//
//  MyPlantsViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 15/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class MyPlantsViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    private let myPlants = MyPlants()

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
        title = "My Plants"
    }

    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.bottleGreen
        ]

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(newPlant))
        navigationItem.rightBarButtonItem?.tintColor = .bottleGreen
    }

    @objc private func newPlant() {
        print("+ tapped")
    }
}

extension MyPlantsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantCell.identifier,
                                                            for: indexPath) as? PlantCell
        else {
            fatalError("Unable to cast cell PlantCell to UICollectionCell")
        }
//        cell.configure()
        return cell
    }
}
