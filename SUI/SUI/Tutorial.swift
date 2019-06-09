//
//  Tutorial.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import Foundation
import SwiftUI

struct Tutorial: Hashable, Identifiable {
    var id: Int
    var title: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Tutorial, rhs: Tutorial) -> Bool {
        return lhs.id == rhs.id
    }
}
