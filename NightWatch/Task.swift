//
//  Task.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name:String
    var isComplete: Bool
    var lastCompleted: Date?
}
