//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    // MARK: - FUNCTION
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }

    // MARK: - BODY
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            VStack(spacing: 16, content: {
                TextField("New Task", text: $task)
                    .foregroundStyle(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(isDarkMode ? Color(UIColor.tertiarySystemGroupedBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .clipShape(.rect(cornerRadius: 10))
                    
                Button(action: {
                    addItem()
                    play(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                }, label: {
                    Spacer()
                    
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    
                    Spacer()
                }) //: BUTTON
                .disabled(isButtonDisabled)
                .onTapGesture(perform: {
                    if isButtonDisabled {
                        play(sound: "sound-tap", type: "mp3")
                    }
                })
                .padding()
                .foregroundStyle(.white)
                .background(isButtonDisabled ? .blue : .pink)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
            }) //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : .white
            )
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }) //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW

#Preview {
    NewTaskItemView(isShowing: .constant(true))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
