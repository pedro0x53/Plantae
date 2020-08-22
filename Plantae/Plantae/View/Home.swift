//
//  Home.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class Home: UIView {
    //  Activities Container
    public let activitiesCollection = ActivitiesCollection()

    public let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "no_activities"))
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

        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true

        self.addSubview(activitiesCollection)
        activitiesCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        activitiesCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        activitiesCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        activitiesCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }

}
