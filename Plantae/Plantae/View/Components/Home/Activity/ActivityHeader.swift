//
//  ActivityHeader.swift
//  Plantae
//
//  Created by Pedro Sousa on 15/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class ActivityHeader: UICollectionReusableView {

    public static let identifier = "activityHeader"

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Activities"
        label.textColor = .bottleGreen
        label.font = UIFont.systemFont(ofSize: 34, weight: .regular)
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

        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
}
