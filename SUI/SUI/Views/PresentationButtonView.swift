//
//  SwiftUIView.swift
//  SUI
//
//  Created by chams on 10/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct PresentationButtonView : View {
    var body: some View {
        PresentationButton(Text("Enter"), destination: Text("Arrived")) {
            print("Present")
        }
    }
}

#if DEBUG
struct PresentationButtonView_Previews : PreviewProvider {
    static var previews: some View {
        PresentationButtonView()
    }
}
#endif
