//
//  ActivityCell.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {

    public static let identifier: String = "activityCell"

    private let imageContainer: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 85, height: 85))
        imageView.layer.cornerRadius = 42.5
        imageView.backgroundColor = .cultured50
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    public let checkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.layer.cornerRadius = 10
        button.backgroundColor = .cultured
        button.contentMode = .scaleAspectFill
        return button
    }()

    private let textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return stack
    }()

    private let plantLabel: UILabel = {
        let label = UILabel()
        label.text = "Plant Name"
        label.textColor = .cultured
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hey, could you give me some water?"
        label.textColor = .cultured
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
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
        self.backgroundColor = .illuminatingEmerald
        self.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 4

        self.addSubview(imageContainer)
        imageContainer.heightAnchor.constraint(equalToConstant: 85).isActive = true
        imageContainer.widthAnchor.constraint(equalToConstant: 85).isActive = true
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true

        self.addSubview(checkButton)
        checkButton.addTarget(self, action: #selector(toggleCheckAction), for: .touchUpInside)
        checkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkButton.trailingAnchor.constraint( equalTo: self.trailingAnchor, constant: -16).isActive = true

        self.addSubview(textStack)
        textStack.addArrangedSubview(plantLabel)
        textStack.addArrangedSubview(descriptionLabel)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        textStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textStack.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 8).isActive = true
    }

    @objc private func toggleCheckAction() {
        toggleCheck()
    }

    public func toggleCheck() {
        if self.checkButton.image(for: .normal) == nil {
            self.checkButton.setImage(UIImage(named: "check_icon"), for: .normal)
        } else {
            self.checkButton.setImage(nil, for: .normal)
        }
    }
}

extension ActivityCell {
    public func configure(data: ReminderData) {
        guard let plant = DataManager.shared.getPlant(identifier: data.plantId) else {
            return
        }

        switch data.overdue {
        case 0:
            self.backgroundColor = .illuminatingEmerald
            self.descriptionLabel.text = DataManager.shared.getMessage(identifier: 0)
        case 1:
            self.backgroundColor = .atomicTagerine
            self.descriptionLabel.text = DataManager.shared.getMessage(identifier: 1)
        case 2:
            self.backgroundColor = .maroonX11
            self.descriptionLabel.text = DataManager.shared.getMessage(identifier: 2)
        default:
            self.backgroundColor = .maroonX11
            self.descriptionLabel.text = DataManager.shared.getMessage(identifier: 3)
        }

        self.plantLabel.text = plant.name
//        self.imageContainer.image
    }
}
