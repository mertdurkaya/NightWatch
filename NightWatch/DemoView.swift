//
//  DemoView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 22.11.2023.
//

import SwiftUI

struct DemoView: View {
    @State var thetask = Task(name: "Check all windows",
                       isComplete: false, lastCompleted: nil)
    @State var buttonTitle = "Mark Complete"
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: thetask.isComplete ? 
                      "checkmark.square" : "square")
                Text(thetask.name)
            }
            Button(action: {
                thetask.isComplete.toggle()
                if (thetask.isComplete) {
                    buttonTitle = "Mark Uncomplete"
                } else {
                    buttonTitle = "Mark Complete"
                }
            }) {
                Text(buttonTitle)
                
            }.padding(.top)
        }
    }
}

#Preview {
    DemoView()
}
