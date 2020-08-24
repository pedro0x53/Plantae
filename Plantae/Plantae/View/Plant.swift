//
//  Plant.swift
//  Plantae
//
//  Created by Pedro Sousa on 17/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class Plant: UIView {

    private let photoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .cultured
        return view
    }()

    public let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 4
        return stack
    }()

    public let name: UILabel = {
        let label = UILabel()
        label.text = "Plant Name"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    public let sName: UILabel = {
        let label = UILabel()
        label.text = "Scientific Name"
        label.textColor = .richBlack
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    private let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 40
        return stack
    }()

    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()

    public let about: UILabel = {
        let label = UILabel()
        label.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Phasellus accumsan, justo eu lacinia faucibus, magna elit dictum dui, in mattis lectus lorem ut diam.
        Etiam consequat massa erat, vel faucibus libero placerat ac.
        """
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 10
        label.lineBreakMode = .byWordWrapping
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

        self.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photo.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 250).isActive = true

        self.addSubview(infoStack)
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        infoStack.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 16).isActive = true
        infoStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoStack.heightAnchor.constraint(equalToConstant: 100).isActive = true

        self.addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        aboutLabel.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 16).isActive = true

        self.addSubview(textStack)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        textStack.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 16).isActive = true
        textStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        textStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        textStack.addArrangedSubview(name)
        textStack.addArrangedSubview(sName)

        self.addSubview(about)
        about.translatesAutoresizingMaskIntoConstraints = false
        about.topAnchor.constraint(equalTo: textStack.bottomAnchor, constant: 8).isActive = true
        about.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        about.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }

    public func generateInfoItem(icon: String, title: String, caption: String) {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 75, height: 100))
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalToConstant: 100).isActive = true
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true

        let photo = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        photo.clipsToBounds = true
        photo.image = UIImage(named: icon)
        container.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        photo.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 50).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .richBlack
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        container.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 4).isActive = true

        let captionLabel = UILabel()
        captionLabel.text = caption
        captionLabel.textColor = .richBlack
        captionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        container.addSubview(captionLabel)
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        captionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true

        self.infoStack.addArrangedSubview(container)
    }
}
