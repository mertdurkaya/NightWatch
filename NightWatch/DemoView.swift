//
//  DemoView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import SwiftUI

struct DemoView: View {
    @StateObject private var theTask = Task(name: "Check all windows",
                       isComplete: false, lastCompleted: nil)
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: theTask.isComplete ?
                      "checkmark.square" : "square")
                Text(theTask.name)
            }
            ControlPanel(theTask: self.theTask)
            
        }
    }
}

#Preview {
    DemoView()
}

struct ControlPanel: View {
    @ObservedObject var theTask: Task
    
    var body: some View {
        if theTask.isComplete == false {
            Button(action: {
                theTask.isComplete = true
            }) {
                Text("Mark Complete")
                
            }.padding(.top)
        } else {
            Button(action: {
                theTask.isComplete = false
            }) {
                Text("Reset")
                
            }.padding(.top)
        }
    }
}
