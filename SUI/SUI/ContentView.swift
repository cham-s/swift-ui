//
//  ContentView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        ListView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
