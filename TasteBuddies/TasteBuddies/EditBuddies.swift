//
//  ContentView.swift
//  TasteBuddies
//
//  Created by Sean Zhang on 10/31/24.
//

import SwiftUI
import CoreData

struct EditBuddies: View {
    // State variable to hold the list of people
    @State private var buddies = [
        Buddy(name: "Buddy 1"),
        Buddy(name: "Buddy 2")
    ]
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($buddies) { $buddy in
                        TextField("Enter name", text: $buddy.name)
                    }.onDelete(perform: deletePerson)
                }
                
                // Button to add more people to the list
                Button(action: addPerson) {
                    Text("Add Person")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: EditDishes(buddies: $buddies)) {
                                    Text("Next")
                                        .padding()
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add/Remove Buddies")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Can't Delete!"), message: Text("Must split a bill between at least two buddies."), dismissButton: .default(Text("OK")))
            }
    }
}
    
    // Function to add a new person with a default name
    private func addPerson() {
        let newPerson = Buddy(name: "Person \(buddies.count + 1)")
        buddies.append(newPerson)
    }
    
    private func deletePerson(at offsets: IndexSet) {
                    if buddies.count <= 2 {
                        showAlert = true
                        return
                    }
            buddies.remove(atOffsets: offsets)
        }
}

#Preview {
    EditBuddies().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
