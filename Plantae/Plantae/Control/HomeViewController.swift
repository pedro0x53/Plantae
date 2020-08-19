//
//  HomeViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    private let home = Home()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }

    override func loadView() {
        super.loadView()
        self.view = home
        home.activitiesCollection.delegate = self
        home.activitiesCollection.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let trefleAPI = TrefleAPI()
        trefleAPI.search(for: "Bracken")
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = true
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
            fatalError("Unable to cast cell ActivityCell to UICollectionCell")
        }
//        cell.configure()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        var view = UICollectionReusableView()
        if kind == UICollectionView.elementKindSectionHeader {
            view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: ActivityHeader.identifier, for: indexPath)
        }
        return view
    }
}
