//
//  PlantsCollection.swift
//  Plantae
//
//  Created by Pedro Sousa on 15/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class PlantsCollection: UICollectionView {

    public static let itemSize: CGFloat = CGFloat(UIScreen.main.bounds.width / 2) - 32

    private static let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = PlantCell.cellSize
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.minimumLineSpacing = CGFloat(16)
        flow.sectionInset = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        return flow
    }()

    init() {
        super.init(frame: .zero, collectionViewLayout: PlantsCollection.layout)
        setupLayout()
        registerCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }

    private func registerCell() {
        self.register(PlantCell.self, forCellWithReuseIdentifier: PlantCell.identifier)
    }
}
