//
//  OnboardingBackgroundView.swift
//  PetSaveOnboarding
//
//  Created by David Duarte on 31/7/22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct OnboardingBackgroundView: View {
  // An array holding all pets displayed in the background.
  let backgroundPets = Pet.backgroundPets
  // Displays each pet on a view.
  var body: some View {
    ZStack {
      ForEach(backgroundPets) { pet in
        pet.petImage
        .resizable()
        .frame(width: 200, height: 200, alignment: .center)
        .position(pet.position)
      }
    }
  }
}
