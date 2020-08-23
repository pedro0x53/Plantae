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
    public weak var delegate: CreatePlantDelegate?

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
        guard let name = createPlant.nameTextField.text else { return }
        guard let commonName = createPlant.commonTextField.text else { return }
        guard let image = createPlant.photoView.image else { return }

        if name.isEmpty || commonName.isEmpty {
            self.dismiss(animated: true, completion: nil)
            return
        }

        guard let unwappedDelegate = self.delegate else { return }
        do {
            let plant = PlantData(commonName: commonName, name: name, photoData: image.pngData()?.base64EncodedString())
            try DataManager.shared.createPlant(plant: plant)

            let date = DataManager.shared.generateDate()
            let reminder = ReminderData(plantId: plant.identifier, date: date)
            try DataManager.shared.createReminder(reminder: reminder)
        } catch {
            unwappedDelegate.somethingWentWrong()
        }

        self.dismiss(animated: true, completion: {
            unwappedDelegate.updatePlants()
        })
    }

    private func setupActionSheetCaller() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(displayActionSheet))
        createPlant.photoView.isUserInteractionEnabled = true
        createPlant.photoView.addGestureRecognizer(tap)
    }

    @objc private func displayActionSheet() {
        let optionalMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

//        let takePhoto = UIAlertAction(title: "Take Photo", style: .default, handler: nil)
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default, handler: importPicture)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

//        optionalMenu.addAction(takePhoto)
        optionalMenu.addAction(choosePhoto)
        optionalMenu.addAction(cancel)

        self.present(optionalMenu, animated: true, completion: nil)
    }
}

extension CreatePlantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.createPlant.photoView.image = image
        dismiss(animated: true, completion: nil)
    }

    func importPicture(alert: UIAlertAction) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}
