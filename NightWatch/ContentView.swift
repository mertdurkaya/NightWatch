//
//  ContentView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 20.11.2023.
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

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: HStack(alignment: .bottom) {
                    Text(Image(systemName: "moon.stars"))
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.yellow)
                    
                    Text("Nightly Tasks")
                        .underline()
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.yellow)
                        .padding(.top)
                        .textCase(.uppercase)
                }) {
                    ForEach(nightlyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: VStack {
                            Text(taskName)
                            Text("Placeholder despription")
                            Text("Placeholder mark button")
                        })
                    })
                }
                
                Section(header: HStack(alignment: .bottom) {
                    Text(Image(systemName: "sunset"))
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.yellow)
                    
                    Text("Weekly Tasks")
                        .underline()
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.yellow)
                        .padding(.top)
                        .textCase(.uppercase)
                }) {
                    ForEach(weeklyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: Text(taskName))
                    })
                }
                
                Section(header: HStack(alignment: .bottom) {
                    Text(Image(systemName: "calendar"))
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.yellow)
                    
                    Text("Monthly Tasks")
                        .underline()
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundStyle(.yellow)
                        .padding(.top)
                        .textCase(.uppercase)
                }) {
                    ForEach(monthlyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: Text(taskName))
                    })
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
