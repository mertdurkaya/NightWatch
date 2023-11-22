//
//  HomeView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var  nightWatchTasks: NightWatchTasks
    
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbol: "moon.stars", title: "Nightly Tasks")) {
                    ForEach(nightWatchTasks.nightlyTasks, content: {
                        task in
                        NavigationLink(destination: DetailsView(task: task), label: {
                            TaskRow(task: task)
                        })
                    })
                }
                
                Section(header: TaskSectionHeader(symbol: "sunset", title: "Weekly Tasks")) {
                    ForEach(nightWatchTasks.weeklyTasks, content: {
                        task in
                        NavigationLink(destination: DetailsView(task: task), label: {
                            TaskRow(task: task)
                        })
                    })
                }
                
                Section(header: TaskSectionHeader(symbol: "calendar", title: "Monthly Tasks")) {
                    ForEach(nightWatchTasks.monthlyTasks, content: {
                        task in
                        NavigationLink(destination: DetailsView(task: task), label: {
                            TaskRow(task: task)
                        })
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

struct TaskRow: View {
    @State var task: Task
    
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundStyle(.gray)
                        .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
        .onTapGesture {
            task.isComplete.toggle()
        }
    }
}


#Preview {
    let nightWatchTasks = NightWatchTasks()
    return ContentView(nightWatchTasks: nightWatchTasks)
}

