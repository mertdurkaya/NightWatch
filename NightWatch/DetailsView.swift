//
//  DetailsView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 21.11.2023.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var taskInterval: String
    
    var body: some View {
        VStack {
            // MARK: Task Title
            HStack {
                Image(systemName: "checkmark")
                Text(taskInterval)
            }
            .font(.title)
            .foregroundColor(Color("AccentColor"))
            .shadow(radius: 10)
            Divider()
            
            // MARK: Task Name
            TaskCardView(taskName: task.name)
            Spacer()
            if verticalSizeClass == .regular {
                // MARK: Task Description
                VStack {
                    Text("asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .foregroundStyle(Color("AccentColor"))
                        .frame(width: 300)
                }
            }
            Spacer()
            Button(task.isComplete ? "Mark Uncomplete" : "Mark Complete") {
                task.isComplete.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        
    }
}
#Preview {
    DetailsView(task: Binding<Task>.constant(Task(name: "Task Name", isComplete: false)), taskInterval: "Nightly")
}
