import SwiftUI
import SwiftData

struct JournalEntry: View {
    @State private var challengeReflection = ""
    @State private var gratitudeReflection = ""
    @State private var learningReflection = ""
    
    // Access the SwiftData context for saving
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss  // Add this to access dismiss environment
    
    var body: some View {
        ZStack {
            PatternBackgroundView()
            
            Image(systemName: "tree")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)  // Set image size
                .foregroundColor(.black.opacity(0.7))
                .shadow(radius: 10)
                .padding(.top, 490)
            
            VStack {
                // Motivational Quote at the Top
                Text("A small reflection, a big impact.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 15)
                    .padding()
                
                // Reflection Prompts and Input Fields
                VStack(alignment: .center, spacing: 20) {  // Align the prompts in the center
                    Text("What challenge did you overcome today?")
                        .font(.headline)
                        .lineLimit(1)  // Limit to one line
                        .minimumScaleFactor(0.5)  // Allow the text to shrink if necessary
                        .multilineTextAlignment(.center)  // Center-align the question
                    
                    TextField("Your answer here...", text: $challengeReflection)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)  // Keep the text field left-aligned
                        .padding(.horizontal)
                    
                    Text("What are you grateful for today?")
                        .font(.headline)
                        .lineLimit(1)  // Limit to one line
                        .minimumScaleFactor(0.5)  // Allow the text to shrink if necessary
                        .multilineTextAlignment(.center)  // Center-align the question
                    
                    TextField("Your answer here...", text: $gratitudeReflection)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)  // Keep the text field left-aligned
                        .padding(.horizontal)
                    
                    Text("What did you learn from today's experience?")
                        .font(.headline)
                        .lineLimit(1)  // Limit to one line
                        .minimumScaleFactor(0.5)  // Allow the text to shrink if necessary
                        .multilineTextAlignment(.center)  // Center-align the question
                    
                    TextField("Your answer here...", text: $learningReflection)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)  // Keep the text field left-aligned
                        .padding(.horizontal)
                }
                .padding()
                
                // Save Button
                Button(action: {
                    saveReflection()
                    dismiss()
                }) {
                    Text("Save Reflections")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.top, 20)
                
                Spacer()  // Push content upwards
            }
            .navigationBarTitle("Reflection Journal", displayMode: .inline)
            .padding()
        }
    }
    
    // Function to save reflection data using SwiftData
    private func saveReflection() {
        // Save the current date when the entry is saved
        let newEntry = JournalData(
            challenge: challengeReflection,
            grateful: gratitudeReflection,
            learn: learningReflection,
            dateEntered: Date()  // Capture the current date
        )
        
        // Insert the new entry into the model context
        modelContext.insert(newEntry)
        
        do {
            // Save the data to the SwiftData context
            try modelContext.save()
            print("Reflection saved successfully!")
            
            // Clear the input fields after saving
            challengeReflection = ""
            gratitudeReflection = ""
            learningReflection = ""
        } catch {
            print("Failed to save reflection: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        JournalEntry()
            .modelContainer(for: JournalData.self, inMemory: true)
    }
}
