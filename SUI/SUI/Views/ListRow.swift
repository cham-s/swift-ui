//
//  ListRow.swift
//  SUI
//
//  Created by chams on 11/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct NumberRow : View {
    
    var number: Number
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(number.title)
                    .font(.system(.title))
                Text(number.subtitle)
                    .font(.system(.subheadline))
            }
            Spacer()
        }
    }
}

#if DEBUG
struct NumberRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NumberRow(number: numData[0])
            NumberRow(number: numData[3])
        }
            .previewLayout(.fixed(width: 300, height: 70))
        
    }
    
}
#endif
