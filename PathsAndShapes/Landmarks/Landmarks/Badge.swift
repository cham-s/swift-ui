//
//  Badge.swift
//  Landmarks
//
//  Created by chams on 04/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct Badge : View {
    var body: some View {
        Path { path in
            var width: CGFloat = 100.0
            let height = width
            path.move(to: CGPoint(x: width * 0.95,
                                  y: height * (0.20 + HexagonParameters.adjustment)
                )
            )
            
            HexagonParameters.points.forEach {
                path.addLine(to:
                .init(
                    x: width * $0.useWidth.0 * $0.xFactors.0,
                    y: height * $0.useHeight.0 * $0.yFactors.0))
            }
        }
        .fill(Color.black)
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
