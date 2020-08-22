//
//  MyPlants.swift
//  Plantae
//
//  Created by Pedro Sousa on 15/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class MyPlants: UIView {

    public let plantsCollection = PlantsCollection()

    public let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "any_plants"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .white

        self.addSubview(plantsCollection)
        plantsCollection.translatesAutoresizingMaskIntoConstraints = false
        plantsCollection.topAnchor.constraint(
            equalTo: self.topAnchor).isActive = true
        plantsCollection.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        plantsCollection.safeAreaLayoutGuide.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        plantsCollection.safeAreaLayoutGuide.trailingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true

        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
