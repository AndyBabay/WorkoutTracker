//
//  CalendarView.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//
// This file will serve as the UI description for the calendar section of the app

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var workoutList: WorkoutList

    @State private var date = Date()

    @State private var selected = false

    var body: some View {
        ZStack {
            VStack {
                Text("Workout History")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(minWidth:100, alignment: .center)
                    .scaledToFill()
                    .padding(.top)

                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                ).datePickerStyle(GraphicalDatePickerStyle()).padding(.all, 21)

                Button(action: { selected = true }) {
                    Text("Select Date")
                        .bold()
                        .frame(minWidth:100, alignment: .center)
                        .scaledToFill()
                        .padding(.top)
                }

                Spacer().frame(height: 100)
            }
            if selected {
                ZStack {
                    Rectangle().foregroundColor(.white)
                    VStack {
                        DailyView(day: date)
                            .environmentObject(workoutList)

                        Spacer()

                        Button(action: { selected = false }) {
                            Text("<- Back To Calandar").padding(.all)
                        }
                    }
                }
            }
        }
    }
}

