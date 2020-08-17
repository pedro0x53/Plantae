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

    private let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
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

    private let name: UILabel = {
        let label = UILabel()
        label.text = "Plant Name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 34, weight: .regular)
        return label
    }()

    private let sName: UILabel = {
        let label = UILabel()
        label.text = "Scientific Name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()

    private let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 40
        return stack
    }()

    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()

    private let about: UILabel = {
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

        self.addSubview(photoContainer)
        photoContainer.translatesAutoresizingMaskIntoConstraints = false
        photoContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true

        photoContainer.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.topAnchor.constraint(equalTo: photoContainer.topAnchor).isActive = true
        photo.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: photoContainer.bottomAnchor).isActive = true

        photoContainer.addSubview(textStack)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        textStack.bottomAnchor.constraint(equalTo: photoContainer.bottomAnchor, constant: -16).isActive = true
        textStack.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor, constant: 16).isActive = true
        textStack.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor, constant: -16).isActive = true

        textStack.addArrangedSubview(name)
        textStack.addArrangedSubview(sName)

        self.addSubview(infoStack)
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        infoStack.topAnchor.constraint(equalTo: photoContainer.bottomAnchor, constant: 30).isActive = true
        infoStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        for _ in 0...2 {
            infoStack.addArrangedSubview(generateInfoItem())
        }

        self.addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        aboutLabel.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 50).isActive = true

        self.addSubview(about)
        about.translatesAutoresizingMaskIntoConstraints = false
        about.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8).isActive = true
        about.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        about.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }

    private func generateInfoItem() -> UIView {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 75, height: 100))
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalToConstant: 75).isActive = true
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true

        let photo = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        photo.backgroundColor = .cultured
        photo.layer.cornerRadius = 25
        photo.clipsToBounds = true
        container.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        photo.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 50).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let title = UILabel()
        title.text = "Title"
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        container.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: photo.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 8).isActive = true

        let caption = UILabel()
        caption.text = "Caption"
        caption.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        container.addSubview(caption)
        caption.translatesAutoresizingMaskIntoConstraints = false
        caption.centerXAnchor.constraint(equalTo: title.centerXAnchor).isActive = true
        caption.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4).isActive = true

        return container
    }
}
