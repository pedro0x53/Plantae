//
//  HomeViewController.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let home = Home()
    private var reminders: [ReminderData] = DataManager.shared.getTodaysReminders()

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        reminders = DataManager.shared.getTodaysReminders()
        home.activitiesCollection.reloadData()
    }

    override func loadView() {
        super.loadView()
        self.view = home
        home.activitiesCollection.delegate = self
        home.activitiesCollection.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupNavBar() {
        self.tabBarController?.navigationItem.title = "Activities"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if reminders.count > 0 {
            home.imageView.removeFromSuperview()
        }
        return reminders.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.identifier,
                                                            for: indexPath) as? ActivityCell
        else {
            fatalError("Unable to cast cell ActivityCell to UICollectionCell")
        }
        cell.configure(data: reminders[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: ActivityDelegate {
    func updateCompletedActivity(identifier: String) {
        DataManager.shared.updateCompleteActivities(reminderID: identifier)
    }
}
