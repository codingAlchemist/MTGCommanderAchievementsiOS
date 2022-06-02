//
//  MTGCommAchievementsApp.swift
//  MTGCommAchievements
//
//  Created by jason debottis on 5/31/22.
//

import SwiftUI

@main
struct MTGCommAchievementsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Achievements()
        }
    }
}
