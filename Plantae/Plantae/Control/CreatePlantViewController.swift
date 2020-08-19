//
//  CreatePlantViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 19/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class CreatePlantViewController: UIViewController {

    private let createPlant = CreatePlant()

    override func loadView() {
        super.loadView()
        view = createPlant
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupActionSheetCaller()
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.topItem?.title = "New Plant"

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain,
                                                            target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem?.tintColor = .bottleGreen
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain,
                                                            target: self, action: #selector(done))
        navigationItem.rightBarButtonItem?.tintColor = .bottleGreen
    }

    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func done() {
        if let name = createPlant.nameTextField.text {
            print(name)
        }

        self.dismiss(animated: true, completion: nil)
    }

    private func setupActionSheetCaller() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(displayActionSheet))
        createPlant.photoView.isUserInteractionEnabled = true
        createPlant.photoView.addGestureRecognizer(tap)
    }

    @objc private func displayActionSheet() {
        let optionalMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let takePhoto = UIAlertAction(title: "Take Photo", style: .default, handler: nil)
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        optionalMenu.addAction(takePhoto)
        optionalMenu.addAction(choosePhoto)
        optionalMenu.addAction(cancel)

        self.present(optionalMenu, animated: true, completion: nil)
    }
}
