//
//  Journal Data.swift
//  HabitApp
//
//  Created by Alexandre  Brillon on 2024-10-15.
//

import Foundation
import SwiftData

@MainActor
@Model
class JournalData {
    var id: UUID
    var challenge: String
    var grateful: String
    var learn: String
    var dateEntered: Date

    init(id: UUID = UUID(), challenge: String = "", grateful: String = "", learn: String = "", dateEntered: Date = Date()) {
        self.id = id
        self.challenge = challenge
        self.grateful = grateful
        self.learn = learn
        self.dateEntered = dateEntered
    }
}

//Mock Data

extension JournalData {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: JournalData.self, configurations:
                                                ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I managed to stick to my morning workout routine despite feeling tired.", grateful: "I’m grateful for my health and the energy to keep going.", learn: "I learned that consistency builds discipline, even on tough days.", dateEntered: Calendar.current.date(byAdding: .day, value: -7, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I successfully completed a complex coding task at work.", grateful: "I’m grateful for having a supportive team at work.", learn: "I learned that taking breaks helps me refocus and solve problems faster.", dateEntered: Calendar.current.date(byAdding: .day, value: -6, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I faced my fear of public speaking and delivered a presentation.", grateful: "I’m grateful for the opportunity to share my ideas.", learn: "I learned that preparation reduces anxiety.", dateEntered: Calendar.current.date(byAdding: .day, value: -5, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I stayed calm during a family disagreement and resolved it peacefully.", grateful: "I’m grateful for having open communication with my family.", learn: "I learned that listening is more powerful than reacting.", dateEntered: Calendar.current.date(byAdding: .day, value: -4, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I resisted the temptation to procrastinate and finished my project early.", grateful: "I’m grateful for the free time I now have because I stayed focused.", learn: "I learned that small, consistent efforts pay off.", dateEntered: Calendar.current.date(byAdding: .day, value: -3, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I navigated through a stressful day at work without feeling overwhelmed.", grateful: "I’m grateful for my colleagues who offered help when I needed it.", learn: "I learned that asking for help is a strength, not a weakness.", dateEntered: Calendar.current.date(byAdding: .day, value: -2, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I committed to healthy eating despite being tempted to eat out.", grateful: "I’m grateful for having access to nutritious food.", learn: "I learned that meal planning keeps me on track.", dateEntered: Calendar.current.date(byAdding: .day, value: -1, to: Date())!))
        container.mainContext.insert(JournalData(id: .init(), challenge: "I handled an unexpected car breakdown without panicking.", grateful: "I’m grateful for roadside assistance and the helpful mechanic.", learn: "I learned that staying calm helps me think more clearly in emergencies.", dateEntered: Date()))

        return container
    }
}

