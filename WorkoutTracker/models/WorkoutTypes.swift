//
//  WorkoutTypes.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//
// This file will hold an enum of workout types to choose from when adding workouts
// into the application

import Foundation

enum WorkoutTypes: String, CaseIterable {
    case Cardio
    case Chest
    case Arms
    case Legs
    case Sholders
    case Unknown
}
