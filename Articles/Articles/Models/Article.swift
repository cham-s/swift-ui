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
    var preview: String
    var article: String
    var date: Date
    var imageName: String
}
