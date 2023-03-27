//
//  experimentApp.swift
//  experiment
//
//  Created by Antonio Virgone on 21/03/23.
//

import SwiftUI

@main
struct ExperimentApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ExperimentMenuView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
