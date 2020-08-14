//
//  Home.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class Home: UIView {

//    public let delegate: UIViewController?

    //  Week Container
    private let calendarContainer: UIView = {
        let view = UIView(frame: .null)
        view.backgroundColor = .cultured
        view.layer.cornerRadius = 20
        return view
    }()

    private let weekLabel: UILabel = {
        let label = UILabel()
        label.text = "This Week"
        label.textColor = UIColor.bottleGreen
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    private let week = WeekCalendar()

    //  Activities Container
    private let headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        return view
    }()

    private let activitiesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 36))
        label.text = "Activities"
        label.textColor = UIColor.bottleGreen
        label.font = UIFont.systemFont(ofSize: 34, weight: .regular)
        return label
    }()

    public let activitiesCollection = ActivitiesCollection()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = UIColor.white

        //  Week Container
        self.addSubview(calendarContainer)
        calendarContainer.translatesAutoresizingMaskIntoConstraints = false
        calendarContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        calendarContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        calendarContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        calendarContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true

        calendarContainer.addSubview(weekLabel)
        weekLabel.translatesAutoresizingMaskIntoConstraints = false
        weekLabel.safeAreaLayoutGuide.centerYAnchor.constraint(
            equalTo: calendarContainer.centerYAnchor, constant: -8).isActive = true
        weekLabel.safeAreaLayoutGuide.leadingAnchor.constraint(
            equalTo: calendarContainer.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true

        calendarContainer.addSubview(week)
        week.translatesAutoresizingMaskIntoConstraints = false
        week.centerXAnchor.constraint(equalTo: calendarContainer.centerXAnchor).isActive = true
        week.topAnchor.constraint(
            equalTo: weekLabel.bottomAnchor, constant: 16).isActive = true

        //  Activities Container
        self.addSubview(headerView)
        headerView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(
            equalTo: calendarContainer.bottomAnchor).isActive = true

        headerView.addSubview(activitiesLabel)
        activitiesLabel.translatesAutoresizingMaskIntoConstraints = false
        activitiesLabel.leadingAnchor.constraint(
            equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        activitiesLabel.bottomAnchor.constraint(
            equalTo: headerView.bottomAnchor, constant: -4).isActive = true

        self.addSubview(activitiesCollection)
        self.sendSubviewToBack(activitiesCollection)
        activitiesCollection.safeAreaLayoutGuide.topAnchor.constraint(
            equalTo: headerView.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        activitiesCollection.safeAreaLayoutGuide.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        activitiesCollection.safeAreaLayoutGuide.trailingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        activitiesCollection.safeAreaLayoutGuide.bottomAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }

}
