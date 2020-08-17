//
//  PlantCell.swift
//  Plantae
//
//  Created by Pedro Sousa on 15/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class PlantCell: UICollectionViewCell {

    public static let cellSize = CGSize(width: CGFloat(UIScreen.main.bounds.width / 2) - 32,
                                         height: 200)

    public static let identifier = "plantCell"

    private let photo: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .cultured
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 10
        imageview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageview
    }()

    private let textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 4
        return stack
    }()

    private let plantNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Plant Name"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()

    private let scientificNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Scientific Name"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
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
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 4

        self.addSubview(textStack)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        textStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        textStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        textStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true

        textStack.addArrangedSubview(plantNameLabel)
        textStack.addArrangedSubview(scientificNameLabel)

        self.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: textStack.topAnchor, constant: -8).isActive = true
        photo.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}

extension PlantCell {
    public func configure() {
    }
}
