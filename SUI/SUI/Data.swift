//
//  Data.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

let tutorialData = [
    Tutorial(id: 1, title: "Text"),
    Tutorial(id: 2, title: "TextField"),
    Tutorial(id: 1, title: "None"),
    Tutorial(id: 1, title: "None")
]

let numData = (1..<100).map { Number(id: $0, title: "\($0) - Title \($0)", subtitle: "Subtitle \($0)") }
