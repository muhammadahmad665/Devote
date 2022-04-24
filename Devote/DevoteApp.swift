//
//  DevoteApp.swift
//  Devote
//
//  Created by Ahmed on 24/04/2022.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
