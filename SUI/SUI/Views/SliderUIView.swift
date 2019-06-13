//
//  SliderUIView.swift
//  SUI
//
//  Created by chams on 12/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct SliderUIView : View {
    @State var rating = 0.5
    
    var body: some View {
        VStack {
            Text("Slider Value: \(self.rating)")
            Slider(value: $rating)
                .padding(30)
            
        }
            .navigationBarTitle(Text("Slider"))
    }
}

#if DEBUG
struct SliderUIView_Previews : PreviewProvider {
    static var previews: some View {
        SliderUIView()
    }
}
#endif
