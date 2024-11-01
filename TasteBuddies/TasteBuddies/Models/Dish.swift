//
//  Dish.swift
//  TasteBuddies
//
//  Created by Sean Zhang on 10/31/24.
//

import Foundation

struct Dish: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var assignedPeople: [String] // Store names of people assigned to the dish
}
