//
//  ListView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ListView : View {
    @EnvironmentObject private var storage: TutorialStorage
    
    var body: some View {
        NavigationView {
            List {
                NavigationButton(destination: TextView()) {
                    Text("TextView")
                }
                NavigationButton(destination: TextFieldView()) {
                    Text("TextField")
                }
            }
            .navigationBarTitle(Text("SwiftUI Tutorials"))
        }
    }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(TutorialStorage())
    }
}
#endif
