//
//  PageModel.swift
//  Pinch
//
//  Created by Yunus Emre Berdibek on 2.10.2023.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
