//
//  TutorialStorage.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class TutorialStorage: BindableObject {
    var didChange = PassthroughSubject<TutorialStorage, Never>()
    var tutorials: [Tutorial] = tutorialData {
        didSet {
            didChange.send(self)
        }
    }
}

final class NumberDataSource: BindableObject {
    var didChange = PassthroughSubject<NumberDataSource, Never>()
    var numbers: [Number] = numData {
        didSet {
            didChange.send(self)
        }
    }
}
