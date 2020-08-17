//
//  PlantViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 17/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class PlantViewController: UIViewController {

    private let plant = Plant()

    override func loadView() {
        super.loadView()
        view = plant
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain,
                                                            target: self, action: #selector(edit))
    }

    @objc private func edit() {
        print("Edit tapped")
    }
}
