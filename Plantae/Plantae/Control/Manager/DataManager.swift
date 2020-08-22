//
//  DataManager.swift
//  Plantae
//
//  Created by Pedro Sousa on 19/08/20.
//  Copyright © 2020 Plantae. All rights reserved.
//

import Foundation

public enum DataManagerErros: Error {
    case plantCreation
    case plantDeletion
    case plantUpdate
    case reminderCreation
    case reminderDeletion
    case reminderUpdate
}

public enum DataType {
    case plants
    case reminders
}

// MARK: - DataManager UserDeafuls CUD
class DataManager {
    public static let shared: DataManager = DataManager()
    private let defaults: UserDefaults
    private let file: FileManager
    private let calendar: Calendar

    init() {
        defaults = UserDefaults.standard
        file = FileManager.default
        calendar = Calendar.current
    }

    private func getDocumentsDirectory() -> URL {
        let paths = file.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    private func directoryExistsAtPath(_ path: String) -> Bool {
        var isDirectory = ObjCBool(true)
        _ = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return isDirectory.boolValue
    }

    private func getMainDirectory() -> URL {
        let dir = file.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Plantae")
        if !directoryExistsAtPath(dir.absoluteString) {
            do {
                try setupFiles()
            } catch {
                fatalError("Plantae directory does not existis and could not be created.")
            }
        }
        return dir
    }

    public func deleteData() {
        let plantsURL = self.getMainDirectory().appendingPathComponent("plants").appendingPathExtension("json")
        let remindersURL = self.getMainDirectory().appendingPathComponent("reminders").appendingPathExtension("json")
        do {
            try file.removeItem(at: plantsURL)
            try file.removeItem(at: remindersURL)
        } catch {
            print("Unable to delete folder.")
        }
        defaults.removeObject(forKey: "messages")
        defaults.removeObject(forKey: "completedActivities")
    }

    public func setupFiles() throws {
        let documentsDirectory = getDocumentsDirectory()
        let mainFolder = documentsDirectory.appendingPathComponent("Plantae")
        if !directoryExistsAtPath(mainFolder.absoluteString) {
            do {
                try file.createDirectory(at: mainFolder, withIntermediateDirectories: true, attributes: nil)

                let plants: [String: Any] = ["plants": []]
                let plantsFile = mainFolder.appendingPathComponent("plants.json")
                let plantsData = try JSONSerialization.data(withJSONObject: plants, options: [.prettyPrinted])
                try plantsData.write(to: plantsFile, options: [.atomicWrite])

                let reminders: [String: Any] = ["reminders": []]
                let remindersFile = mainFolder.appendingPathComponent("reminders.json")
                let remindersData = try JSONSerialization.data(withJSONObject: reminders, options: [.prettyPrinted])
                try remindersData.write(to: remindersFile, options: [.atomicWrite])

            } catch {
                print("Setup Failed: \(error)")
            }
        }

        if defaults.object(forKey: "messages") == nil {
            defaults.set([
                "Hi! Could you give me some water?",
                "Hey, I'm a little bit thirsty.",
                "Hello? Did you forget about me?",
                "I'm feeling so lonely. Is anyone there? :("
            ], forKey: "messages")
        }

        if defaults.object(forKey: "completedActivities") == nil {
            defaults.set([], forKey: "completedActivities")
        }
    }

    public func update(forFile type: DataType, object: Any) throws {
        switch type {
        case .plants:
            do {
                if let plants = object as? [PlantData] {
                    let plantsURL = self.getMainDirectory().appendingPathComponent("plants")
                        .appendingPathExtension("json")
                    let data = try JSONEncoder().encode(plants)
                    try data.write(to: plantsURL, options: [.atomicWrite])
                }
            } catch {
                throw DataManagerErros.plantCreation
            }
        case .reminders:
            do {
                if let reminders = object as? [ReminderData] {
                    let remindersURL = self.getMainDirectory().appendingPathComponent("reminders")
                        .appendingPathExtension("json")
                    let data = try JSONEncoder().encode(reminders)
                    try data.write(to: remindersURL, options: [.atomicWrite])
                }
            } catch {
                throw DataManagerErros.plantCreation
            }
        }
    }
}

// MARK: - DataManager Plants CRUD
extension DataManager {
    public func getAllPlants() -> [PlantData] {
        let plantsURL = self.getMainDirectory().appendingPathComponent("plants").appendingPathExtension("json")
        var res: [PlantData] = []
        if let data = try? Data(contentsOf: plantsURL) {
            if let plants = try? JSONDecoder().decode([PlantData].self, from: data) {
                res.append(contentsOf: plants)
            }
        }
        return res
    }

    public func getPlant(identifier: String) -> PlantData? {
        var plant: PlantData?
        let plants = getAllPlants()
        if let index = plants.firstIndex(where: { $0.identifier == identifier }) {
            plant = plants[index]
        }
        return plant
    }

    public func createPlant(plant: PlantData) throws {
        var plants = getAllPlants()
        plants.append(plant)
        try update(forFile: .plants, object: plants)
    }

    public func deletePlant(identifier: String) throws {
        var plants = getAllPlants()
        if let index = plants.firstIndex(where: { $0.identifier == identifier }) {
            plants.remove(at: index)
        }
        try update(forFile: .plants, object: plants)
    }

    public func updatePlant(plant: PlantData) throws {
        var plants = getAllPlants()
        if let index = plants.firstIndex(where: { $0.identifier == plant.identifier }) {
            plants[index] = plant
        }
        try update(forFile: .plants, object: plants)
    }
}

// MARK: - DataManager Reminders Crus
extension DataManager {
    private func getAllReminders() -> [ReminderData] {
        let remindersURL = self.getMainDirectory().appendingPathComponent("reminders").appendingPathExtension("json")
        var res: [ReminderData] = []
        if let data = try? Data(contentsOf: remindersURL) {
            if let reminders = try? JSONDecoder().decode([ReminderData].self, from: data) {
                res.append(contentsOf: reminders)
            }
        }
        return res
    }

    public func getTodaysReminders() -> [ReminderData] {
        let allReminders = getAllReminders()
        let overduedReminders = getAllOverduedReminders()
        var todaysReminders: [ReminderData] = []
        todaysReminders.append(contentsOf: overduedReminders)
        todaysReminders.append(contentsOf: allReminders.filter({ $0.weekday == calendar.component(.weekday,
                                                                                                  from: Date()) }))
        return todaysReminders
    }

    private func getAllOverduedReminders() -> [ReminderData] {
        let allReminders = getAllReminders()
        var overduedReminders: [ReminderData] = []
        for reminder in allReminders where reminder.overdue > 0 {
            overduedReminders.append(reminder)
        }
        overduedReminders = overduedReminders.sorted(by: { $0.overdue > $1.overdue })
        return overduedReminders
    }

    public func createReminder(reminder: ReminderData) throws {
        var reminders = getAllReminders()
        reminders.append(reminder)
        try update(forFile: .reminders, object: reminders)
    }

    public func deleteReminder(identifier: String) throws {
        var reminders = getAllReminders()
        if let index = reminders.firstIndex(where: { $0.identifier == identifier }) {
            reminders.remove(at: index)
        }
        try update(forFile: .reminders, object: reminders)
    }

    public func updateReminder(reminder: ReminderData) throws {
        var reminders = getAllReminders()
        if let index = reminders.firstIndex(where: { $0.identifier == reminder.identifier }) {
            reminders[index] = reminder
        }
        try update(forFile: .reminders, object: reminders)
    }

    public func updateOverdued(remindersIDs: [String]) throws {
        let reminders = getAllReminders()
        for reminder in reminders where !remindersIDs.contains(reminder.identifier) {
            var overduedReminder = reminder
            overduedReminder.overdue += 1
            try self.updateReminder(reminder: overduedReminder)
        }
    }

    public func updateCompleteActivities(reminderID: String) {
        if var completed = defaults.array(forKey: "completedActivities") as? [String] {
            if let index = completed.firstIndex(of: reminderID) {
                completed.remove(at: index)
            } else {
                completed.append(reminderID)
            }
            defaults.set(completed, forKey: "completedActivities")
        }
    }

    public func printCompletedActivities() {
        if let completed = defaults.array(forKey: "completedActivities") as? [String] {
            for activity in completed {
                print(activity)
            }
            print()
        }
    }

    public func getAllWeekdaysReminders() -> [Int] {
        var weekdays: [Int] = []
        let reminders = getAllReminders()
        for reminder in reminders {
            weekdays.append(reminder.weekday)
        }
        return weekdays
    }
}

extension DataManager {
    public func getMessage(identifier: Int) -> String {
        var message: String = ""
        if let messages = defaults.array(forKey: "messages") as? [String] {
            message = messages[identifier]
        }
        return message
    }
}
