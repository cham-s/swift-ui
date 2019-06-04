//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by chams on 04/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct SwiftUIView : View {
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

#if DEBUG
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
#endif
