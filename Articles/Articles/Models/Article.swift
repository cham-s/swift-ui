//
//  Article.swift
//  Articles
//
//  Created by chams on 06/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import Foundation
import SwiftUI

struct Article: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var preview: String
    var article: String
    var date: Date
    var imageName: String
    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MM/dd/YYYY")
        return formatter.string(from: date)
    }
    
    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }
}
