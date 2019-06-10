//
//  ImageView.swift
//  SUI
//
//  Created by chams on 10/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ImageView : View {
    var body: some View {
        VStack {
            ForEach((1..<6), content: { i in
                Image(systemName: "icloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Length(30.0 * CGFloat(i)),
                           height: Length((30.0 * 0.6)) * CGFloat(i),
                           alignment: .center)
                    .tapAction {
                        print("Tap \(i)")
                }
            })
        }
            .navigationBarTitle(Text("Image View"))
    }
}

#if DEBUG
struct ImageView_Previews : PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
#endif
