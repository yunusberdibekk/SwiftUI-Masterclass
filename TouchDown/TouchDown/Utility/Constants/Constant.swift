//
//  Constant.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct: Product = products[0]

// COLOR
let colorBackground: Color = .init(.colorBackground)
let colorGray: Color = .init(UIColor.systemGray4)

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] { Array(repeating: .init(.flexible(), spacing: rowSpacing), count: 2) }

// UX
let feedBack = UIImpactFeedbackGenerator(style: .medium)

// API

// IMAGE

// FONT

// STRING

// MISC
