//
//  TutorialView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct TutorialView : View {
    var tutorial: Tutorial
    var body: some View {
        return TextView()
    }
}

#if DEBUG
struct TutorialView_Previews : PreviewProvider {
    static var previews: some View {
        TutorialView(tutorial: tutorialData[0])
    }
}
#endif
