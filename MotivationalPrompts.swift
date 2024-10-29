//
//  MotivationalPrompts .swift
//  HabitApp
//
//  Created by Alexandre  Brillon on 2024-10-15.
//

import Foundation

struct MotivationalPrompts {
    static let prompts = [
        "Take a deep breath and keep moving forward.",
        "Every step matters.",
        "You've got the power to make today count.",
        "Believe in your journey.",
        "Gratitude turns what we have into enough.",
        "What can you be grateful for today?",
        "Reflect, breathe, and grow.",
        "A small reflection, a big impact.",
        "One day at a time, you're building something great.",
        "Small habits, big changes.",
        "Your efforts today shape tomorrow.",
        "You're closer than you think."
    ]
    
    // Function to return a random prompt
    static func getRandomPrompt() -> String {
        return prompts.randomElement() ?? "You're doing great!"
    }
}
