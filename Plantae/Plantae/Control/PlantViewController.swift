//
//  PlantViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 17/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

private enum WeekDays: String, CaseIterable {
    case sun = "Sunday"
    case mon = "Monday"
    case tue = "Tuesday"
    case wed = "Wednesday"
    case thr = "Thrusday"
    case fri = "Friday"
    case sat = "Saturday"
}

class PlantViewController: UIViewController {

    private let plantView = Plant()
    public var plantID: String?

    override func loadView() {
        super.loadView()
        view = plantView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        setupPlantInfo()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .richBlack
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self,
                                                            action: #selector(edit))
    }

    @objc private func edit() {
        print("Edit tapped")
    }

    private func setupPlantInfo() {
        if let plantID = plantID {
            if let plant = DataManager.shared.getPlant(identifier: plantID) {
                plantView.name.text = "Name: \(plant.name)"
                plantView.sName.text = "Species: \(plant.commonName)"

                if let stringData = Data(base64Encoded: plant.photoData) {
                    plantView.photo.image = UIImage(data: stringData)
                } else {
                    plantView.photo.image = UIImage(named: "default_image")
                }

                let calendar: Calendar = Calendar.current
                let formatter = DateFormatter()
                formatter.dateStyle = .full
                formatter.timeStyle = .full
                if let date = formatter.date(from: plant.creationDate) {
                    let weekday = WeekDays.allCases[calendar.component(.weekday, from: date)].rawValue
                    plantView.generateInfoItem(icon: "watering_icon", title: "Waternig", caption: "Every \(weekday)")
                    let days = DataManager.shared.daysBetween(start: date, end: Date())
                    plantView.generateInfoItem(icon: "calendar_icon", title: "Days", caption: "\(days)")
                }

                plantView.about.text = plant.about
            }
        }
    }
}
