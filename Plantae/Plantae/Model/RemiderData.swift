//
//  RemiderData.swift
//  Plantae
//
//  Created by Pedro Sousa on 20/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

public enum Days: String, CaseIterable {
    case sunday = "Su"
    case monday = "Mo"
    case tuesday = "Tu"
    case wednesday = "We"
    case thursday = "Th"
    case friday = "Fr"
    case saturday = "Sa"
}

// MARK: - Reminder
struct ReminderData: Codable {
    var identifier: String
    var plantId: String
    var status: Int
    var overdue: Int
    var weekday: Int

    init(plantId: String, weekday: Int) {
        self.identifier = UUID().uuidString
        self.plantId = plantId
        self.status = 1
        self.overdue = 0
        self.weekday = weekday
    }
}
