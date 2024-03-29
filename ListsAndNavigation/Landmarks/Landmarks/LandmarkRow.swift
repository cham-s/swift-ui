//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by chams on 04/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[1])
            LandmarkRow(landmark: landmarkData[1])
        }
         .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
