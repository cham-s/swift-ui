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
        NavigationView {
            List(landmarkData) { landmark in
                NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (9.7-inch)"].identified(by: \.self)) { deviceName in                        LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
#endif
