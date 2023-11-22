//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Mert Durkaya on 20.11.2023.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
