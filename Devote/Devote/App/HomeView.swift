//
//  ContentView.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 9.10.2023.
//

import CoreData
import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES

    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var showNewTaskItem: Bool = false

    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default
    )

    private var items: FetchedResults<Item>

    // MARK: - FUNCTION

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - MAIN VIEW

                VStack {
                    // MARK: - HEADER

                    HStack(spacing: 10, content: {
                        // TITLE
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4)

                        Spacer()

                        // EDIT BUTTON
                        EditButton()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(
                                Capsule().stroke(.white, lineWidth: 2)
                            )

                        // APPEARANCE BUTTON
                        Button(action: {
                            isDarkMode.toggle()
                            play(sound: "sound-tap", type: "mp3")
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Image(systemName: isDarkMode ?"moon.circle.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                        }) //: BUTTON
                    }) //: HSTACK
                    .padding()
                    .foregroundStyle(.white)

                    Spacer(minLength: 80)

                    // MARK: - NEW TASK BUTTON

                    Button(action: {
                        showNewTaskItem = true
                        play(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))

                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }) //: BUTTON
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(Capsule())
                    )
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)

                    // MARK: - TASKS

                    List {
                        ForEach(items) { item in
                            ListRowItemView(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    } //: LIST
                    .clipShape(.rect(cornerRadius: 20))
                    .listStyle(.inset)
                    .padding(20)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                } //: VSTACK
                .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                .transition(.move(edge: .bottom))

                // MARK: - NEW TASK ITEM

                if showNewTaskItem {
                    BlankView(
                        backgroundColor: isDarkMode ? Color.black : Color.gray,
                        backgroundOpacity: isDarkMode ? 0.3 : 0.5
                    )
                    .onTapGesture {
                        withAnimation {
                            showNewTaskItem = false
                        }
                    }

                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
            } //: ZSTACK
            .background(
                BackgroundImageView()
                    .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
            )
            .background(
                backgroundGradient.ignoresSafeArea()
            )
        } //: NAVSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
