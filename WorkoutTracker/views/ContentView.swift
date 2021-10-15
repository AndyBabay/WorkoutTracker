//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var workoutList: WorkoutList

    @EnvironmentObject private var userBio: UserBio


    let date = Date()
    var body: some View {
        TabView {
            DailyView(day: date)
                .environmentObject(workoutList)
                .tabItem {
                    Image(systemName: "bolt.circle")
                }
            CalendarView()
                .environmentObject(workoutList)
                .tabItem {
                    Image(systemName: "calendar.circle")
                }
            ExternalResources()
                .environmentObject(workoutList)
                .tabItem {
                    Image(systemName: "video.circle")
                }
            UserBioView(
                feet: userBio.height.0,
                name: userBio.name,
                inches: userBio.height.1,
                age: String(userBio.age),
                weight: String(userBio.weight)
            )
                .environmentObject(userBio)
                .tabItem{
                    Image(systemName: "person.circle")
                }
        }.onAppear() {
            workoutList.load()
            userBio.load()
        }
    }
}
