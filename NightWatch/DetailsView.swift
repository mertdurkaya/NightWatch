//
//  DetailsView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 21.11.2023.
//

import SwiftUI

struct DetailsView: View {
    let task: Task
    
    var body: some View {
        VStack {
            Text(task.name)
            Text("Placeholder despription")
            Text("Placeholder mark button")
        }
    }
}
#Preview {
    DetailsView(task: Task(name: "Test", isComplete: false))
}
