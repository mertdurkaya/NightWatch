//
//  ContentView.swift
//  NightWatch
//
//  Created by Mert Durkaya on 20.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    // MARK: Nigthly
                    // TODO: Do not forget to make them seperate views
                    // FIXME: It's not broken, only way of showing 'fixme'
                    Group {
                        HStack(alignment: .bottom) {
                            Text(Image(systemName: "moon.stars"))
                                .symbolRenderingMode(.multicolor)
                                .font(.title3)
                                .fontWeight(.heavy)
                            
                            Text("Nightly Tasks")
                                .underline()
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundStyle(.yellow)
                                .padding(.top)
                                .textCase(.uppercase)
                        }
                        .padding(.bottom)
                    }
                    Text("Check all windows ")
                    Text("Check all doors")
                    Text("Check safe")
                    Text("Check mailbox")
                    Text("Inspect security cameras")
                    Text("Clear ice from sidewalks")
                    Text("Document 'strange and unusual' occurrences")
                    Divider()
                    
                    // MARK: Weekly
                    Group {
                        HStack(alignment: .bottom) {
                            Text(Image(systemName: "sunset"))
                                .font(.title3)
                                .fontWeight(.heavy)
                            
                            Text("Weekly Tasks")
                                .underline()
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundStyle(.yellow)
                                .padding(.top)
                                .textCase(.uppercase)
                        }
                        .padding(.bottom)
                    }
                    Text("Check inside all rooms")
                    Text("Walk the premieter of property")
                    Divider()
                    
                    // MARK: Monthly
                    Group {
                        HStack(alignment: .bottom) {
                            Text(Image(systemName: "calendar"))
                                .font(.title3)
                                .fontWeight(.heavy)
                            
                            Text("Monthly Tasks")
                                .underline()
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundStyle(.yellow)
                                .padding(.top)
                                .textCase(.uppercase)
                        }
                        .padding(.bottom)
                        Text("Test security alarm")
                        Text("Test motion detection")
                        Text("Test smoke alarms")
                    }
                }
                Spacer()
            }
            .padding()
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
