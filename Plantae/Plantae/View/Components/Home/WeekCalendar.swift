//
//  WeekCalendar.swift
//  Plantae
//
//  Created by Pedro Sousa on 13/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import UIKit

class WeekCalendar: UIStackView {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 70))
        self.axis = .horizontal
        self.distribution = .equalCentering
        self.spacing = 0
        self.alignment = .center

        setupLayout()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
        setupWeek(firstDay: 9, today: 14, activity: [1, 2, 4])
    }

    private func setupWeek(firstDay: Int = 1, today: Int = 0, activity: [Int] = []) {
        for index in 0...6 {
            var currentLabel: String = "S"
            var currentDay: Bool = false
            var activityDay: Bool = false

            switch index {
            case 0:
                currentLabel = "S"
            case 1:
                currentLabel = "M"
            case 2:
                currentLabel = "T"
            case 3:
                currentLabel = "W"
            case 4:
                currentLabel = "T"
            case 5:
                currentLabel = "F"
            case 6:
                currentLabel = "S"
            default:
                break
            }

            if (firstDay + index) == today {
                currentDay = true
            }

            for day in activity where day == index && !currentDay {
                activityDay = true
            }

            let dayView = generateDay(label: currentLabel, number: "\(firstDay + index)",
                                      current: currentDay, activity: activityDay)
            self.addArrangedSubview(dayView)
        }
    }

    private func generateDay(label: String, number: String,
                             current: Bool = false, activity: Bool = false) -> UIView {
        let dayContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 70))
        dayContainer.translatesAutoresizingMaskIntoConstraints = false
        dayContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        dayContainer.widthAnchor.constraint(equalToConstant: 40).isActive = true

        let dayID = UILabel()
        dayContainer.addSubview(dayID)
        dayID.text = label
        dayID.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dayID.translatesAutoresizingMaskIntoConstraints = false
        dayID.topAnchor.constraint(equalTo: dayContainer.topAnchor).isActive = true
        dayID.centerXAnchor.constraint(equalTo: dayContainer.centerXAnchor).isActive = true

        let dayLabel = UILabel()
        dayContainer.addSubview(dayLabel)
        dayLabel.text = number
        dayLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerXAnchor.constraint(equalTo: dayContainer.centerXAnchor).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: dayContainer.centerYAnchor, constant: 8).isActive = true

        if current {
            let highlighter = generateHighlighter()
            highlighter.translatesAutoresizingMaskIntoConstraints = false
            dayContainer.addSubview(highlighter)
            highlighter.centerXAnchor.constraint(equalTo: dayLabel.centerXAnchor).isActive = true
            highlighter.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor).isActive = true
        }

        if activity {
            let dot = generateDot()
            dayContainer.addSubview(dot)
            dot.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 8).isActive = true
            dot.centerXAnchor.constraint(equalTo: dayLabel.centerXAnchor).isActive = true
        }

        return dayContainer
    }

    private func generateHighlighter() -> UIView {
        let highlighter = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        highlighter.layer.cornerRadius = CGFloat(15)
        highlighter.layer.borderColor = UIColor.illuminatingEmerald.cgColor
        highlighter.layer.borderWidth = 1
        highlighter.heightAnchor.constraint(equalToConstant: 30).isActive = true
        highlighter.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return highlighter
    }

    private func generateDot() -> UIView {
        let dot = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        dot.backgroundColor = .illuminatingEmerald
        dot.layer.cornerRadius = 2
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.heightAnchor.constraint(equalToConstant: 4).isActive = true
        dot.widthAnchor.constraint(equalToConstant: 4).isActive = true
        return dot
    }
}
