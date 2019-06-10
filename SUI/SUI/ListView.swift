//
//  ListView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ListView : View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationButton(destination: TextView()) {
                    Text("Text")
                }
                NavigationButton(destination: TextFieldView()) {
                    Text("TextField")
                }
                NavigationButton(destination: ImageView()) {
                    Text("Image")
                }
                NavigationButton(destination: WebImage()) {
                    Text("Web Image")
                }
                NavigationButton(destination: ButtonView()) {
                    Text("Button")
                }
                NavigationButton(destination: NavigationButtonView()) {
                    Text("Navigation Button")
                }


            }
            .navigationBarTitle(Text("SwiftUI Tutorials"))
        }
    }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
#endif
