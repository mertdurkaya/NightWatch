//
//  DetailsView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 21.11.2023.
//

import SwiftUI

struct DetailsView: View {
    let taskName: String
    
    var body: some View {
        VStack {
            Text(taskName)
            Text("Placeholder despription")
            Text("Placeholder mark button")
        }
    }
}
#Preview {
    DetailsView(taskName: "Test")
}
