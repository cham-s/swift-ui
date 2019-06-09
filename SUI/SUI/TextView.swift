//
//  TextView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct TextView : View {
    var body: some View {
        
            Text("SwiftUI")
                .color(.orange)
                .bold()
                .font(.system(.largeTitle))
                .fontWeight(.medium)
                .navigationBarTitle(Text("TextView"))
    }
}

#if DEBUG
struct TextView_Previews : PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
#endif
