//
//  CenterModifier.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 7.10.2023.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
