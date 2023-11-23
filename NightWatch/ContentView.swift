//
//  HomeView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var  nightWatchTasks: NightWatchTasks
    @State private var focusModeOn = false
    @State private var showAlert = false
    
    let nightly = "Nightly"
    let weekly = "Weekly"
    let monthly = "Monthly"
    
    var body: some View {
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbol: "moon.stars", title: nightly)) {
                    
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id, content: {
                        task, taskIndex in
                        
                        let nightWatchTaskWrapper = $nightWatchTasks
                        
                        let theTaskBinding = nightWatchTaskWrapper.nightlyTasks[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(destination: DetailsView(task: theTaskBinding, taskInterval: nightly), label: {
                                TaskRow(task: theTaskBinding)
                            })
                        }
                    })
                    .onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: TaskSectionHeader(symbol: "sunset", title: weekly)) {
                    
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id, content: {
                        task, taskIndex in
                        
                        let nightWatchTaskWrapper = $nightWatchTasks
                        
                        let theTaskBinding = nightWatchTaskWrapper.weeklyTasks[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(destination: DetailsView(task: theTaskBinding, taskInterval: weekly), label: {
                                TaskRow(task: theTaskBinding)
                            })
                        }
                    })
                    .onDelete(perform: { indexSet in
                        nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: TaskSectionHeader(symbol: "calendar", title: monthly)) {
                    
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id: \.0.id, content: {
                        task, taskIndex in
                        
                        let nightWatchTaskWrapper = $nightWatchTasks
                        let theTaskBinding = nightWatchTaskWrapper.monthlyTasks[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(destination: DetailsView(task: theTaskBinding, taskInterval: monthly), label: {
                                TaskRow(task: theTaskBinding)
                            })
                        }
                    })
                    .onDelete(perform: { indexSet in
                        nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    EditButton()
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("Reset", action: {
                        showAlert = true
                    })
                })
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn, label: {
                        Text("Focus Mode")
                    })
                }
            }
            .navigationTitle("Home")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("This will reset all data."),
                primaryButton: .default(
                    Text("Cancel")
                ),
                secondaryButton: .destructive(
                    Text("Reset"),
                    action: {
                        let refreshedNightWatchTasks = NightWatchTasks()
                        self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                        self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                        self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
                    }
                )
            )
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
                    .foregroundStyle(.red)
                
                Text(title)
                    .underline()
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .textCase(.uppercase)
            }
        }
    }
    
    struct TaskRow: View {
        @Binding var task: Task
        
        var body: some View {
            HStack {
                Image(systemName: task.isComplete ? "checkmark" : "square")
                    .font(.system(size: 25))
                    .foregroundStyle(.yellow)
                Text(task.name)
                    .foregroundStyle(task.isComplete ? .gray : .green)
                    .strikethrough(task.isComplete ? true : false)
            }
            .onTapGesture {
                task.isComplete.toggle()
            }
        }
    }
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

#Preview {
    let nightWatchTasks = NightWatchTasks()
    return ContentView(nightWatchTasks: nightWatchTasks)
}
