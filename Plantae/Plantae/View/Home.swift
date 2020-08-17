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
        label.textColor = .bottleGreen
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    private let week = WeekCalendar()

    //  Activities Container
    public let activitiesCollection = ActivitiesCollection()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .white

        //  Week Container
        self.addSubview(calendarContainer)
        calendarContainer.translatesAutoresizingMaskIntoConstraints = false
        calendarContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        calendarContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        calendarContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        calendarContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true

        calendarContainer.addSubview(weekLabel)
        weekLabel.translatesAutoresizingMaskIntoConstraints = false
        weekLabel.centerYAnchor.constraint(equalTo: calendarContainer.centerYAnchor, constant: -8).isActive = true
        weekLabel.leadingAnchor.constraint(equalTo: calendarContainer.leadingAnchor, constant: 16).isActive = true

        calendarContainer.addSubview(week)
        week.translatesAutoresizingMaskIntoConstraints = false
        week.centerXAnchor.constraint(equalTo: calendarContainer.centerXAnchor).isActive = true
        week.topAnchor.constraint(equalTo: weekLabel.bottomAnchor, constant: 16).isActive = true

        self.addSubview(activitiesCollection)
        self.sendSubviewToBack(activitiesCollection)
        activitiesCollection.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor, constant: 8).isActive = true
        activitiesCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        activitiesCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        activitiesCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }

}
