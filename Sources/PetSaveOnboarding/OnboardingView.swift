//
//  OnboardingView.swift
//  PetSaveOnboarding
//
//  Created by David Duarte on 31/7/22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
  // Holds the onboarding model’s object.
  let onboarding: OnboardingModel

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12, style: .circular)
        .fill(.white)
        .shadow(radius: 12)
        .padding(.horizontal, 20)
      VStack(alignment: .center) {
        VStack {
          // Sets the title, description and image from the model to the UI.
          Text(onboarding.title)
            .foregroundColor(.rwDark)
            .font(.largeTitle)
            .bold()
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)

          Text(onboarding.description)
            .foregroundColor(.rwDark)
            .multilineTextAlignment(.center)
            .padding([.top, .bottom], 10)
            .padding(.horizontal, 10)

          onboarding.image
            .resizable()
            .frame(width: 140, height: 140, alignment: .center)
            .foregroundColor(.rwDark)
            .aspectRatio(contentMode: .fit)
        }
        .padding()
      }
    }
  }
}
