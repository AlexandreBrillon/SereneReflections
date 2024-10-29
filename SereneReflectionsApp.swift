//
//  SereneReflections.swift
//  Serene Reflections App
//
//  Created by Alexandre Brillon on 2024-10-12.
//
//  This file is the main entry point for the Serene Reflections app, which focuses on gratitude journaling
//  and reflective prompts. It initializes the main view of the app and sets up data models.

import SwiftUI
import SwiftData  // Import SwiftData for data management.

/**
 * The main struct for the app, conforming to the App protocol.
 */
@main
struct SereneReflections: App {
    var body: some Scene {
        WindowGroup {
            // Set the initial view of the app to HomePageView.
            HomePageView()
                .modelContainer(for: JournalData.self)  // Attach the JournalData model to the HomePageView for data handling.
        }
    }
}
