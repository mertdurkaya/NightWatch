//
//  TaskCardView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 23.11.2023.
//

import SwiftUI

struct TaskCardView: View {
    @State var taskName: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("AccentColorReverse"))
                .shadow(radius: 10)
            VStack {
                Text(taskName)
                    .font(.title3)
                    .foregroundStyle(.red)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 360, height: 100)
    }
}

#Preview {
    TaskCardView(taskName: "Test Data")
}
