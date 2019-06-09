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
                ForEach(storage.tutorials) { tutorial in
                    NavigationButton(destination: TutorialView(tutorial: tutorial)) {
                        Text(tutorial.title)
                    }
                }
            }
            .navigationBarTitle(Text("Tutorials"))
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
