//
//  ContentView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var name: String = ""
    let placeHolder = Text("Enter name here")
    @State var endEditing = false
    
    var body: some View {
       Text("Hello, World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
