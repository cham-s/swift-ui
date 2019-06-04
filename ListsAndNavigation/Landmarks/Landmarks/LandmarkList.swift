//
//  LandmarkList.swift
//  Landmarks
//
//  Created by chams on 04/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {
        List(landmarkData) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
#endif
