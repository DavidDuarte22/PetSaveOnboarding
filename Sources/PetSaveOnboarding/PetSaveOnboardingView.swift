//
//  PetSaveOnboardingView.swift
//  PetSaveOnboarding
//
//  Created by David Duarte on 31/7/22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import SwiftUI

public struct PetSaveOnboardingView: View {
  // Holds the current index of the onboarding view.
  @State var currentPageIndex = 0
  // The initializer to read the onboarding model array.
  public init(items: [OnboardingModel]) {
    self.items = items
  }
  // A completion handler for listening to Next and Skip button actions.
  private var onNext: (_ currentIndex: Int) -> Void = { _ in }
  private var onSkip: () -> Void = {}
  // Holds the array that contains all of the onboarding models.
  private var items: [OnboardingModel] = []
  // Titles for the Next and Skip buttons.
  private var nextButtonTitle: String {
    items[currentPageIndex].nextButtonTitle
  }
  private var skipButtonTitle: String {
    items[currentPageIndex].skipButtonTitle
  }

  public var body: some View {
    if items.isEmpty {
      Text("No items to show.")
    } else {
        VStack {
          TabView(selection: $currentPageIndex) {
            // Creates OnboardingView to show each onboarding item in the array.
            ForEach(0..<items.count) { index in
              OnboardingView(onboarding: items[index])
                .tag(index)
            }
          }
          .padding(.bottom, 10)
          .tabViewStyle(.page)
          .indexViewStyle(.page(backgroundDisplayMode: .always))
          .onAppear(perform: setupPageControlAppearance)
          // Next and Skip buttons added to the view.
          Button(action: next) {
            Text(nextButtonTitle)
              .frame(maxWidth: .infinity, maxHeight: 44)
          }
          .animation(nil, value: currentPageIndex)
          .buttonStyle(OnboardingButtonStyle(color: .rwDark))

          Button(action: onSkip) {
            Text(skipButtonTitle)
              .frame(maxWidth: .infinity, maxHeight: 44)
          }
          .animation(nil, value: currentPageIndex)
          .buttonStyle(OnboardingButtonStyle(color: .rwGreen))
          .padding(.bottom, 20)
        }
        .background(OnboardingBackgroundView())
      }
  }

  // Create onNext(action:) and onSkip(action:) to listen to the buttons’ actions.
  public func onNext(
    action: @escaping (_ currentIndex: Int) -> Void
  ) -> Self {
    var petSaveOnboardingView = self
    petSaveOnboardingView.onNext = action
    return petSaveOnboardingView
  }

  public func onSkip(action: @escaping () -> Void) -> Self {
    var petSaveOnboardingView = self
    petSaveOnboardingView.onSkip = action
    return petSaveOnboardingView
  }

  // This method sets the selected page control indicator color.
  private func setupPageControlAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor =
      UIColor(.rwGreen)
  }

  // Changes the index of the current onboarding view with animation.
  private func next() {
    withAnimation {
      if currentPageIndex + 1 < items.count {
        currentPageIndex += 1
      } else {
        currentPageIndex = 0
      }
    }
    onNext(currentPageIndex)
  }
}

struct OnboardingButtonStyle: ButtonStyle {
  let color: Color
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(color)
      .clipShape(Capsule())
      .buttonStyle(.plain)
      .padding(.horizontal, 20)
      .foregroundColor(.white)
  }
}


private extension PreviewProvider {
  static var mockOboardingModel: [OnboardingModel] {
    [
      OnboardingModel(
        title: "Welcome to\n PetSave",
        description:
          "Looking for a Pet?\n Then you're at the right place",
        image: .bird
      ),
      OnboardingModel(
        title: "Search...",
        description:
          "Search from a list of our huge database of animals.",
        image: .dogBoneStand,
        nextButtonTitle: "Allow"
      ),
      OnboardingModel(
        title: "Nearby",
        description:
          "Find pets to adopt from nearby your place...",
        image: .chameleon
      )
    ]
  }
}

struct PetSaveOnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    PetSaveOnboardingView(items: mockOboardingModel)
  }
}
