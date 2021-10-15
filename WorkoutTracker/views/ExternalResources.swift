//
//  ExternalResources.swift
//  WorkoutTracker
//
//  Created by Raj Patel on 5/2/21.
//

import SwiftUI
import WebKit
struct ExternalResources: View {

    
    var body: some View {
        let chest = SwiftUIWebView(url: URL(string:"https://www.youtube.com/watch?v=89e518dl4I8"))
            .navigationTitle("Chest Help")
        let cardio = SwiftUIWebView(url: URL(string:"https://www.youtube.com/watch?v=cfetualiJqs"))
            .navigationTitle("Cardio Help")
        let shoulders = SwiftUIWebView(url: URL(string:"https://www.youtube.com/watch?v=jv31A4Ab4nA"))
            .navigationTitle("Shoulder Help")
        let legs = SwiftUIWebView(url: URL(string:"https://www.youtube.com/watch?v=RjexvOAsVtI"))
            .navigationTitle("Leg Help")
        let arm = SwiftUIWebView(url: URL(string:"https://www.youtube.com/watch?v=6QgR6Tjle7g"))
            .navigationTitle("Arm Help")
        
        VStack {
            Text("Help").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.green).padding()
            Text("Follow the options below to instructional videos")
            NavigationView{
                VStack(alignment: .leading, spacing: 30){
                    
                    List() {
                        NavigationLink(
                            destination: cardio,
                            label: {
                                Text("Cardio Help").font(.title)
                            })
                        NavigationLink(
                            destination: chest,
                            label: {
                                Text("Chest Help").font(.title)
                            })
                        NavigationLink(
                            destination: arm,
                            label: {
                                Text("Arms Help").font(.title)
                            })
                        NavigationLink(
                            destination: legs,
                            label: {
                                Text("Legs Help").font(.title)
                            })
                        NavigationLink(
                            destination: shoulders,
                            label: {
                                Text("Shoulders Help").font(.title)
                            })
                    }
                }
            }

        }
    }
}

struct ExternalResources_Previews: PreviewProvider {
    static var previews: some View {
        ExternalResources()
    }
}
