//
//  ContentView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 20.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .badge(2)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            DetailsView(taskName: "Test Task")
                .badge("!")
                .tabItem {
                    Label("Test", systemImage: "testtube.2")
            }
        }
    }
}

#Preview {
    ContentView()
}


