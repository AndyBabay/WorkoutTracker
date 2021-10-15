//
//  DailyView.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//
// This file will serve as the tab for viewing todays entered workouts

import SwiftUI
import Foundation

struct DailyView: View {
    @EnvironmentObject var workoutList: WorkoutList
    @State private var newWorkout = Workout()

    @State private var addWorkout = false

    @State var day: Date

    var dateFormatter = DateFormatter()

    var body: some View {
        VStack {
            let _ = dateFormatter.dateFormat = "MM/dd/yyyy"
            let today = dateFormatter.string(from: day)
            let todaysW = workoutList.getDay(date: today)
            Text("\(today)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .frame(minWidth:100, alignment: .center)
                .scaledToFill()
                .padding(.top)
            if todaysW.count > 0 {
                List(0 ..< todaysW.count, id: \.self) { i in
                    Text("\(todaysW[i].name) \(todaysW[i].duration) minutes" as String)
                        .frame(minWidth:100, alignment: .leading)
                        .scaledToFill()
                }
            } else {
                List() {
                Text("No Entries for today")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
                    .scaledToFill()
                }
            }

            ZStack {
                Button(action : { addWorkout = !addWorkout }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                }.frame(width: 50, height: 50)

                if addWorkout {
                    Rectangle().foregroundColor(.white)
                    VStack {
                        Button(action: { addWorkout = false }) {
                            Text("Done")
                                .bold()
                                .foregroundColor(.red)
                        }

                        Spacer().frame(height: 30)

                        AddWorkout(date: today).environmentObject(workoutList)

                        Spacer()
                    }
                }
            }
            Spacer()
        }
    }
}

