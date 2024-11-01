//
//  Items.swift
//  TasteBuddies
//
//  Created by Sean Zhang on 10/31/24.
//

import SwiftUI
import CoreData

struct EditDishes: View {
    @State private var dishName: String = ""
    @State private var dishPrice: String = ""
    @State private var selectedPeople: [String] = []
    @Binding var buddies: [Buddy] // Binding to access the list of people from the previous view

    var body: some View {
        VStack {
            Text("Add Dish/Drink")
                .font(.largeTitle)
                .padding()

            TextField("Dish Name", text: $dishName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Price", text: $dishPrice)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Assign to People:")
                .font(.headline)
                .padding(.top)

            }

            Button(action: addDish) {
                Text("Add Dish")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }

    private func addDish() {
        // Convert price from String to Double
        guard let price = Double(dishPrice), !dishName.isEmpty else {
            // Handle invalid input (e.g., show an alert)
            return
        }
        let newDish = Dish(name: dishName, price: price, assignedPeople: selectedPeople)
        // Here, you would typically save the new dish to a list or a database
        print("Added Dish: \(newDish)")
        // Reset input fields
        dishName = ""
        dishPrice = ""
        selectedPeople = []
    }
}
