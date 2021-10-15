//
//  WorkoutTrackerApp.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//

import SwiftUI

@main
struct WorkoutTrackerApp: App {
    @StateObject private var workoutList = WorkoutList()
    @StateObject private var userBio = UserBio()
   
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(workoutList).environmentObject(userBio)
        }
    }
}
