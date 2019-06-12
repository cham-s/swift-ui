//
//  SwiftUIView.swift
//  SUI
//
//  Created by chams on 10/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct NavigationButtonView : View {
    var body: some View {
        NavigationButton(destination: NavigationButtonView()) {
            Text("Navigation Button")
                .bold()
                .font(.largeTitle)
        }
            .navigationBarTitle(Text("Navigation Button"))
    }
}

#if DEBUG
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationButtonView()
    }
}
#endif
