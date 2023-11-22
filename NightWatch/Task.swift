//
//  Task.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import Foundation

class Task: ObservableObject {
    internal init(name: String, isComplete: Bool, lastCompleted: Date? = nil) {
        self.name = name
        self.isComplete = isComplete
        self.lastCompleted = lastCompleted
    }
    
    let name:String
    @Published var isComplete: Bool
    var lastCompleted: Date?
}
