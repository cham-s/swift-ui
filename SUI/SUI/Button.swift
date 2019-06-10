//
//  Button.swift
//  SUI
//
//  Created by chams on 10/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ButtonView : View {
    var body: some View {
       Button(action: {
            print("Tap")
       }) {
            Text("Order")
                .bold()
                .font(.system(size: 40, design: .rounded))
                .shadow(radius: 1)
        }
            .navigationBarTitle(Text("Button"))
    }
}

#if DEBUG
struct Button_Previews : PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
#endif
