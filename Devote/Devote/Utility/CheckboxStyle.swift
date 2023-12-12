//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ?"checkmark.circle.fill" : "circle")
                .foregroundStyle(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture(perform: {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)

                    if configuration.isOn {
                        play(sound: "sound-rise", type: "mp3")
                    } else {
                        play(sound: "sound-tap", type: "mp3")
                    }
                })

            configuration.label
        } //: HSTACK
    }
}

#Preview {
    Toggle("Placeholder label", isOn: .constant(false))
        .toggleStyle(CheckboxStyle())
        .padding()
}
