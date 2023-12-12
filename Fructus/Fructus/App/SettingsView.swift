//
//  SettingsView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 4.10.2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES

    @AppStorage("isOnboarding") var isOnboarding = false
    @Environment(\.dismiss) var dismiss

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1

                    GroupBox(label: SettingsLabelView(labelText: "Fructus",
                                                      labelImage: "info.circle"))
                    {
                        Divider().padding(.vertical, 4)

                        HStack(alignment: .center, spacing: 10) {
                            Image(.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(.rect(cornerRadius: 10))

                            Text("Most fruits are naturally low in fat, sodium and calories. None have cholestorol. Fruits are sources of many assential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    } //: BOX

                    // MARK: - SECTION 2

                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")) {
                        Divider().padding(.vertical, 4)

                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minWidth: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)

                        Toggle(isOn: $isOnboarding, label: {
                            Text(isOnboarding ? "Restarted".uppercased() :
                                "Restart".uppercased())
                                .fontWeight(.bold)
                                .foregroundStyle(isOnboarding ? .green : .secondary)
                        })
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    } //: BOX

                    // MARK: - SECTION 3

                    GroupBox(label: SettingsLabelView(labelText: "Application",
                                                      labelImage: "apps.iphone"))
                    {
                        SettingsRowView(name: "Developer",
                                        content: "Yunus Emre Berdibek")

                        SettingsRowView(name: "Designer",
                                        content: "Robert Petras")

                        SettingsRowView(name: "Compatibility",
                                        content: "iOS 17")

                        SettingsRowView(name: "GitHub",
                                        linkLabel: "@yunusberdibekk",
                                        linkDestination: "github.com/yunusberdibekk")

                        SettingsRowView(name: "Twitter",
                                        linkLabel: "@yunusberdibekk",
                                        linkDestination: "twitter.com/yunusberdibekk")

                        SettingsRowView(name: "SwiftUI",
                                        content: "5.0")

                        SettingsRowView(name: "Version",
                                        content: "1.1.0")
                    } //: BOX
                } //: VSTACK
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
                .padding()
            } //: SCROOL
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

#Preview {
    SettingsView()
}
