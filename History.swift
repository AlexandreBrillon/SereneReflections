//
//  History.swift
//
//  Created by Alexandre  Brillon on 2024-10-15.
//

import SwiftUI
import SwiftData

struct History: View {
    // Fetch JournalData entries sorted by dateEntered (newest first)
    @Query(sort: \JournalData.dateEntered, order: .reverse) private var journalEntries: [JournalData]
    @Environment(\.modelContext) var modelContext
    @State private var selectedDate: Date = Date() // State variable to hold the selected date
    
    var body: some View {
        ZStack {
            // Custom background view
            PatternBackgroundView()
            
            VStack {
                // DatePicker for filtering entries
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle()) // Use compact style for DatePicker
                    .padding()
                
                // Reflection stats (optional)
                VStack{
                    Text("Total Reflections: \(journalEntries.count)")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .padding(.bottom, 10)
                }
                .padding(.vertical)
                
                // List of filtered journal entries
                List {
                    ForEach(filteredEntries, id: \.id) { entry in  // Loop through filtered entries
                        VStack(alignment: .leading) {
                            Text("Date: \(entry.dateEntered, formatter: dateFormatter)")
                                .font(.headline) // Headline for the date
                            Text("🏆 Challenge: \(entry.challenge)")
                            Text("🙏 Grateful: \(entry.grateful)")
                            Text("📚 Learned: \(entry.learn)")
                                .swipeActions {
                                    // Swipe action to delete a journal entry
                                    Button("Delete", role: .destructive) {
                                        modelContext.delete(entry)  // Delete the specific entry
                                        do {
                                            try modelContext.save()  // Save changes to the context
                                        } catch {
                                            print("😡 Error: Could not save after deleting entry.")
                                        }
                                    }
                                }
                        }
                        .padding()  // Add padding inside each entry
                        .background(PatternBackgroundView())  // Apply custom background to each entry
                        .cornerRadius(20)  // Rounded corners for the entry
                        .shadow(radius: 5)  // Add a shadow effect
                        .listRowBackground(Color.clear)  // Make the list row background clear
                        .listRowSeparator(.hidden)  // Hide the default row separators
                    }
                }
                .listStyle(PlainListStyle())  // Use plain list style
                .padding(.bottom, 100)  // Add padding to bottom of the list
            }
            // An image (optional, aesthetic element)
            Image(systemName: "apple.meditate")
                .padding(.top, 650)
                .font(.system(size: 60))  // Set image size
        }
        .navigationBarTitle("Reflection History", displayMode: .inline)  // Set navigation title
        .multilineTextAlignment(.center)
    }
    
    // Computed property to filter journal entries based on selected date
    private var filteredEntries: [JournalData] {
        journalEntries.filter { entry in
            // If the selected date is today, return all entries
            if Calendar.current.isDateInToday(selectedDate) {
                return true  // Show all entries
            } else {
                // Otherwise, filter based on the selected date (remove time for comparison)
                let normalizedEntryDate = stripTime(from: entry.dateEntered)
                let normalizedSelectedDate = stripTime(from: selectedDate)
                return normalizedEntryDate == normalizedSelectedDate
            }
        }
    }

    // Function to strip the time component from a Date, keeping only year, month, and day
    private func stripTime(from date: Date) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return calendar.date(from: components) ?? date
    }

    // Date formatter for displaying dates in a readable format
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    NavigationStack {
        History()
                    .modelContainer(for: JournalData.self, inMemory: true)
            .modelContainer(JournalData.preview)
    }
}
