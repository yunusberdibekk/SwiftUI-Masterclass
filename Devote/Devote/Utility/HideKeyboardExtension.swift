//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
