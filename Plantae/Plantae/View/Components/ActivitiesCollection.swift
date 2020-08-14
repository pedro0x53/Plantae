//
//  ActivitiesCollection.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class ActivitiesCollection: UICollectionView {

//    private static let layout: UICollectionViewLayout = {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                              heightDimension: .estimated(100))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                               heightDimension: .fractionalHeight(1.0))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        group.interItemSpacing = .fixed(16)
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }()

    private static let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
        flow.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.minimumLineSpacing = CGFloat(16)
        flow.sectionHeadersPinToVisibleBounds = true
        return flow
    }()

    init() {
        super.init(frame: .zero, collectionViewLayout: ActivitiesCollection.layout)
        setupLayout()
        registerCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
    }

    private func registerCell() {
        self.register(ActivityCell.self, forCellWithReuseIdentifier: ActivityCell.identifier)
    }
}
