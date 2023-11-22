//
//  NightWatchTasks.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import Foundation

class NightWatchTasks: ObservableObject {
    @Published var nightlyTasks = [
        Task(name: "Check all windows", isComplete: false, lastCompleted: nil),
        Task(name: "Check all doors", isComplete: false, lastCompleted: nil),
        Task(name: "Check safe", isComplete: false, lastCompleted: nil),
        Task(name: "Check mailbox", isComplete: false, lastCompleted: nil),
        Task(name: "Check all windows", isComplete: false, lastCompleted: nil),
        Task(name: "Inspect security cameras", isComplete: false, lastCompleted: nil),
        Task(name: "Clear ice from sidewalks", isComplete: false, lastCompleted: nil),
        Task(name: "Document 'strange and unusual' occurrences", isComplete: false, lastCompleted: nil)
    ]

    @Published var weeklyTasks = [
        Task(name: "Check inside all rooms", isComplete: false, lastCompleted: nil),
        Task(name: "Walk the premieter of property", isComplete: false, lastCompleted: nil)
    ]

    @Published var monthlyTasks = [
        Task(name: "Test security alarm", isComplete: false, lastCompleted: nil),
        Task(name: "Test motion detection", isComplete: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", isComplete: false, lastCompleted: nil)
    ]
}
