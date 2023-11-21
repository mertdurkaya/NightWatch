//
//  HomeView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import SwiftUI

let nightlyTasks = [
    "Check all windows",
    "Check all doors",
    "Check safe",
    "Check mailbox",
    "Inspect security cameras",
    "Clear ice from sidewalks",
    "Document 'strange and unusual' occurrences"
]

let weeklyTasks = [
    "Check inside all rooms",
    "Walk the premieter of property"
]

let monthlyTasks = [
    "Test security alarm",
    "Test motion detection",
    "Test smoke alarms"
]

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbol: "moon.stars", title: "Nightly Tasks")) {
                    ForEach(nightlyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: DetailsView(taskName: taskName))
                    })
                }
                
                Section(header: TaskSectionHeader(symbol: "sunset", title: "Weekly Tasks")) {
                    ForEach(weeklyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: DetailsView(taskName: taskName))
                    })
                }
                
                Section(header: TaskSectionHeader(symbol: "calendar", title: "Monthly Tasks")) {
                    ForEach(monthlyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: DetailsView(taskName: taskName))
                    })
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct TaskSectionHeader: View {
    let symbol: String
    let title: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(Image(systemName: symbol))
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundStyle(.yellow)
            
            Text(title)
                .underline()
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundStyle(.yellow)
                .padding(.top)
                .textCase(.uppercase)
        }
    }
}

#Preview {
    HomeView()
}
