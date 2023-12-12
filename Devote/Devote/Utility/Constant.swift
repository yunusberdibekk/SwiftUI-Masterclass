//
//  Constant.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: -  UX

var feedback = UINotificationFeedbackGenerator()
