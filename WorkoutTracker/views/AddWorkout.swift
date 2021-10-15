//  AddWorkout.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//
// This file will serve as the view for when users are adding in new workouts

import SwiftUI

struct AddWorkout: View {

    @EnvironmentObject var workoutList: WorkoutList

    @State var workoutObj: Workout = Workout()
    @State var toggled = false
    @State var workoutName: String = ""
    @State var wtype: WorkoutTypes?
    @State var name: String = ""
    @State var duration: String = ""
    @State var reps: Int = 0

    @State var date: String

    @State private var sourceChoose: Bool = false

    @State private var toggle = false
    @State private var noName = false

    var body: some View {
        if toggle {
            form
        } else {
            form
        }
    }

    var form: some View {
        VStack {
            HStack {
                Text("Workout Type: ")
                Text(wtype?.rawValue ?? "click to choose")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        sourceChoose = true
                    }
                    .actionSheet(isPresented: $sourceChoose) {
                        var buttonList: [ActionSheet.Button] = []
                        for src in WorkoutTypes.allCases {
                            buttonList.append(
                                ActionSheet.Button.default(
                                    Text(src.rawValue),
                                    action: {wtype = src}
                                )
                            )
                        }

                        return ActionSheet(
                            title: Text("Select Workout Type"),
                            message: Text("Use the following list:"),
                            buttons: buttonList
                        )
                    }
            }
            VStack {
                Text("Workout name:").padding()
                TextField("workout type" ,text: $workoutName)
                    .frame(width: 150, height: 20, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Spacer()

                Text("Time in minutes:").padding()
                TextField("Duration", text: $duration)
                    .frame(width: 150, height: 20, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Spacer().frame(height: 30)

                Button(action:{                    
                    if wtype == nil {
                        wtype = WorkoutTypes.Unknown
                    }
                    if workoutName == "" {
                        noName = true
                    } else {
                        workoutList.addWorkout(workOut: Workout(name: workoutName, wtype: wtype!, duration: (Int)(duration) ?? 0), date: date)

                        workoutName = ""
                        wtype = nil
                        duration = ""
                        toggle = !toggle
                    }
                }) { Text("ADD") }
                .alert(isPresented: $noName) {

                    return Alert(title: Text("No Name Found"), message: Text("We Need A Name!"))
                }

                Spacer()
            }
        }
    }
}

