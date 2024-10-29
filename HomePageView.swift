/**
 * @file HomePageView.swift
 * @author Alexandre Brillon
 *
 * This SwiftUI view represents the home page of the Serene Reflections app. It includes motivational prompts and navigation links for journal entries and reflection history.
 */

import SwiftUI
import UserNotifications

struct HomePageView: View {
    @State private var isBreathing = false  // Controls the breathing animation state.
    @State private var currentPrompt: String = MotivationalPrompts.getRandomPrompt()  // Stores the current motivational prompt.

    var body: some View {
        NavigationView {
            ZStack {
                // Background pattern view component for aesthetic enhancement.
                PatternBackgroundView()
                
                // Weather icon representation for visual appeal.
                Image(systemName: "cloud.sun.rain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)  // Defines the size of the image.
                    .foregroundColor(.black.opacity(0.7))
                    .shadow(radius: 10)
                    .padding(.top, 450)
                
                VStack {
                    // Displays the current motivational prompt with animation.
                    Text(currentPrompt)
                        .font(.system(size: 28))
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        .padding()
                        .multilineTextAlignment(.center)
                        .scaleEffect(isBreathing ? 1.09 : 0.95)  // Dynamic scaling for animation.
                        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: isBreathing)
                        .onAppear {
                            self.isBreathing = true  // Activates the animation when the view appears.
                        }
                        .padding(.top, 100)  // Provides top padding to accommodate device notch.

                    Spacer()  // Provides flexible space between elements in the stack.

                    // Contains navigation links to other views in the app.
                    VStack(spacing: 20) {  // Adds vertical spacing between buttons.
                        // Navigation link to begin a new reflection journal entry.
                        NavigationLink(destination: JournalEntry()) {
                            HStack {
                                Text("Begin Reflection")
                                    .foregroundColor(.black)
                                    .font(.system(size: 24))
                                Image(systemName: "pencil.and.scribble")
                                    .foregroundColor(.black)
                                    .font(.system(size: 24))
                            }
                            .padding()
                            .frame(width: 350, height: 100)  // Defines the size of the button.
                            .background(Color.white.opacity(0.57))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        }
                        
                        // Navigation link to view the reflection history.
                        NavigationLink(destination: History()) {
                            HStack {
                                Text("Reflection History")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                                Image(systemName: "clock.arrow.circlepath")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                            }
                            .padding()
                            .frame(width: 350, height: 100)  // Defines the size of the button.
                            .background(Color.black.opacity(0.57))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        }
                    }
                    .padding(.bottom, 300)  // Bottom padding for positioning the buttons.
                }
            }
            .navigationBarTitle("", displayMode: .inline)  // Sets the navigation bar title and display mode.
        }
    }
}

// Preview configuration for the HomePageView.
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .modelContainer(JournalData.preview)  // Provides preview data context.
    }
}
