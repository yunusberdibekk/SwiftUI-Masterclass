//
//  Shop.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
