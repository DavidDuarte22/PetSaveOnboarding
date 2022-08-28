//
//  OnboardingModel.swift
//  PetSaveOnboarding
//
//  Created by David Duarte on 31/7/22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import SwiftUI

public struct OnboardingModel: Identifiable {
  public let id = UUID()
  // 1Creates title, description and image to hold the data that appears on each page of the onboarding screen.
  let title: String
  let description: String
  let image: Image

  // These properties hold the titles for the Next and Skip buttons shown on each page.
  let nextButtonTitle: String
  let skipButtonTitle: String

  // 3
  public init(
    title: String,
    description: String,
    image: Image,
    nextButtonTitle: String = "Next",
    skipButtonTitle: String = "Skip") {
      self.title = title
      self.description = description
      self.image = image
      self.nextButtonTitle = nextButtonTitle
      self.skipButtonTitle = skipButtonTitle
    }
}
