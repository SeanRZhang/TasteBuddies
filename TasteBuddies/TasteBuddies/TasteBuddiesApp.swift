//
//  TasteBuddiesApp.swift
//  TasteBuddies
//
//  Created by Sean Zhang on 10/31/24.
//

import SwiftUI

@main
struct TasteBuddiesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            EditBuddies()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
