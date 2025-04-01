//
//  AppView.swift
//  AIChat
//
//  Created by Ricardo Garza on 3/28/25.
//

import SwiftUI

struct AppView: View {

    @State  var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - Tab Bar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
        AppView(appState: AppState(showTabBar: false))
}
