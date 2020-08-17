//
//  ActivitiesCollection.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class ActivitiesCollection: UICollectionView {

    private static let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 56)
        flow.minimumLineSpacing = CGFloat(16)
        flow.sectionHeadersPinToVisibleBounds = true
        return flow
    }()

    init() {
        super.init(frame: .zero, collectionViewLayout: ActivitiesCollection.layout)
        setupLayout()
        registerCell()
        registerHeader()
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

    private func registerHeader() {
        self.register(ActivityHeader.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: ActivityHeader.identifier)
    }
}
