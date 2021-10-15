//
//  ShowWorkout.swift
//  WorkoutTracker
//
//  Created by Zach Harrell on 3/18/21.
//
// This file will serve as the data storage for all of the added workouts in the app

import Foundation

class WorkoutList: ObservableObject {
    static let filename = "workoutHistory.json"

    @Published var list: [String: Array<Workout>]


    init() {
        self.list = [:]
    }

    func save() {
        var savedList : [String: [PersistentWorkout]] = [:]
        for date in self.list.keys {
            savedList[date] = []
            let day = self.getDay(date: date)
            for wo in day {
                savedList[date]!.append(wo.to_percist())
            }
        }
        if let data = try? JSONEncoder().encode(savedList) {
            let docDir: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            if let file = docDir?.appendingPathComponent(Self.filename) {
                try? data.write(to: file)
            }
        }
    }

    func load() {
        let docDir: URL? = try? FileManager.default.url(
            for: .documentDirectory, in: .userDomainMask,
            appropriateFor: nil, create: false )
        if let file = docDir?.appendingPathComponent(WorkoutList.filename)
        {
            if let data = try? Data(contentsOf: file) {
                if let ddata = try? JSONDecoder().decode([String: [PersistentWorkout]].self, from: data) {
                    self.list = [:]
                    for day in ddata.keys {
                        var woHistory: [Workout] = []
                        let stuff = ddata[day]
                        for wo in stuff! {
                            woHistory.append(Workout(pWorkout: wo))
                        }
                        self.list[day] = woHistory
                    }
                }
            }
        }
    }
    func addWorkout(workOut: Workout, date: String) {
        if list[date] != nil {
            list[date]!.append(workOut)
        } else {
            list[date] = [workOut]
        }
        save()
    }

    func getDay(date: String) -> Array<Workout> {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy"
//        let dateString = dateFormatter.string(from: date)

        if list[date] != nil {
            return list[date]!
        } else {
            return []
        }
    }
}
