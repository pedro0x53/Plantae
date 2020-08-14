//
//  HomeViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let home = Home()

    override func loadView() {
        super.loadView()
        self.view = home
        home.activitiesCollection.delegate = self
        home.activitiesCollection.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.identifier,
                                                            for: indexPath) as? ActivityCell
        else {
            fatalError("Unable to cast cell to UICollectionCell")
        }
//        cell.congigure()
        return cell
    }
}
