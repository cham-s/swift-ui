//
//  PickerView.swift
//  SUI
//
//  Created by chams on 11/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct PickerView : View {
    @State var leftIndex = 0
    @State var rightIndex = 0
    
    let leftSource = (1..<10).map { $0.isMultiple(of: 2) ? "👾\($0)" : "🤖\($0)" }
    let rightSource = (11...36).map { String($0 - 1, radix: $0).uppercased() }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(alignment: .center) {
                    VStack {
                        Text("Left Value:")
                        Text("\(self.leftSource[self.leftIndex])")
                            .color(.orange)
                            .bold()
                            .font(.largeTitle)
                        Picker(selection: self.$leftIndex, label: Text("Left Picker")) {
                            ForEach(0..<self.leftSource.count) {
                                Text(self.leftSource[$0]).tag($0)
                            }
                            }
                            .frame(width: geometry.size.width / 2)
                        
                    }
                    VStack {
                        Text("Right Value:")
                        Text("\(self.rightSource[self.rightIndex])")
                            .color(.orange)
                            .bold()
                            .font(.largeTitle)
                        Picker(selection: self.$rightIndex, label: Text("Left Picker")) {
                            ForEach(0..<self.rightSource.count) {
                                Text(self.rightSource[$0]).tag($0)
                            }
                            }
                            .frame(width: geometry.size.width / 2)
                        
                    }
                    
                }
                Spacer()
            }
        }
        .navigationBarTitle(Text("Picker"))
    }
}

#if DEBUG
struct PickerView_Previews : PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
#endif
