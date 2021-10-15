//
//  Workout.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//
// This file will hold the definition for the workout class

import Foundation

struct PersistentWorkout: Codable {
    var name: String
    var wtype: String
    var reps: Int
    var duration: Int
    var weight: Int
}

class Workout: ObservableObject, Equatable {
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        lhs.name == rhs.name && lhs.wtype == rhs.wtype
    }

    @Published var name: String
    @Published var wtype: WorkoutTypes
    @Published var reps: Int
    @Published var duration: Int
    @Published var weight: Int

    convenience init(name: String, wtype: WorkoutTypes, duration: Int) {
        self.init(name: name, wtype: wtype, duration: duration, reps: 0, weight: 0)
    }

    init(name: String, wtype: WorkoutTypes, duration: Int, reps: Int, weight: Int) {
        self.name = name
        self.wtype = wtype
        self.duration = duration
        self.reps = reps
        self.weight = weight
    }

    init(pWorkout: PersistentWorkout) {
        self.name = pWorkout.name
        self.wtype = WorkoutTypes(rawValue: pWorkout.wtype)!
        self.duration = pWorkout.duration
        self.reps = pWorkout.reps
        self.weight = pWorkout.weight
    }

    init() {
        self.name = ""
        self.wtype = .Unknown
        self.duration = 0
        self.reps = 0
        self.weight = 0
    }

    func to_percist() -> PersistentWorkout {
        return PersistentWorkout(name: self.name, wtype: self.wtype.rawValue, reps: self.reps, duration: self.duration, weight: self.weight)
    }
}
