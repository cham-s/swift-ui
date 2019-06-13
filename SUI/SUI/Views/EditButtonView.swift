//
//  EditButtonView.swift
//  SUI
//
//  Created by chams on 11/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct EditButtonView : View {
    @ObjectBinding private var source = NumberDataSource()
    
    var body: some View {
        List {
            ForEach(source.numbers) { number in
                NumberRow(number: number)
            }
                .onDelete(perform: delete)
                .onMove(perform: movePlace)
        }
        .navigationBarTitle(Text("Edit Row"), displayMode: .large)
        .navigationBarItems(trailing: EditButton())
    }
    
    
    func delete(at offset: IndexSet) {
        if let last = offset.last?.id {
            source.numbers.remove(at: last)
            print(source.numbers.count)
        }
    }
    
    func movePlace(from source: IndexSet, to destination: Int) {
        print(source, destination)
    }
}

#if DEBUG
struct EditButtonView_Previews : PreviewProvider {
    static var previews: some View {
        EditButtonView()
    }
}
#endif
