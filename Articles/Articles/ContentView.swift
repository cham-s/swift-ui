//
//  ContentView.swift
//  Articles
//
//  Created by chams on 06/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//


import SwiftUI

struct ContentView : View {
    
    var body: some View {
        ArticleListView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
