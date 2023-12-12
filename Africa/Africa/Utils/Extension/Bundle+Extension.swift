//
//  Bundle % Extension.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the json file
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
      
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
      
        // 3. Create a decoder
        let decoder = JSONDecoder()
      
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
      
        // 5. Return the ready-to-use data
        return loaded
    }
}
