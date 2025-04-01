//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Ricardo Garza on 3/31/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
    
            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }
    
    func onFinishButtonPressed() {
        //other logic to complete onboarding
        root.updateViewState(showTabBarView: true)
    }
    
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
