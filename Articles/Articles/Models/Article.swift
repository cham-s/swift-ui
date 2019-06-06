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
    let id: Int
    let preview: String
    let article: String
    let date: Date
    let imageName: String
}
