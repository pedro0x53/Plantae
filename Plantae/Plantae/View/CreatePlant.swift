//
//  CreatePlant.swift
//  Plantae
//
//  Created by Pedro Sousa on 19/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class CreatePlant: UIView {

    public let photoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "default_image"))
        imageView.backgroundColor = .cultured
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    public let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Plant Name"
        textField.textColor = .richBlack
        textField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return textField
    }()

    private let commonLabel: UILabel = {
        let label = UILabel()
        label.text = "Species"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    public let commonTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Common Species Name"
        textField.textColor = .richBlack
        textField.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return textField
    }()

    private let wateringLabel: UILabel = {
        let label = UILabel()
        label.text = "Watering"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
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

        self.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        photoView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoView.heightAnchor.constraint(equalToConstant: 250).isActive = true

        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true

        self.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        self.addSubview(commonLabel)
        commonLabel.translatesAutoresizingMaskIntoConstraints = false
        commonLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        commonLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        commonLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true

        self.addSubview(commonTextField)
        commonTextField.translatesAutoresizingMaskIntoConstraints = false
        commonTextField.topAnchor.constraint(equalTo: commonLabel.topAnchor).isActive = true
        commonTextField.leadingAnchor.constraint(equalTo: commonLabel.trailingAnchor, constant: 16).isActive = true
        commonTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

//        self.addSubview(wateringLabel)
//        wateringLabel.translatesAutoresizingMaskIntoConstraints = false
//        wateringLabel.topAnchor.constraint(equalTo: commonLabel.bottomAnchor, constant: 16).isActive = true
//        wateringLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
//        wateringLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func generateSetupItem() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .equalSpacing
        stack.spacing = 4
        return stack
    }
}
