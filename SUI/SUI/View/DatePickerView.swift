//
//  DatePickerView.swift
//  SUI
//
//  Created by chams on 12/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI
import Combine

struct DatePickerView : View {
    @ObjectBinding var server = DateServer()
    private let items = (0..<10).map { "\($0)" }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Pick a date")
            DatePicker($server.date,
                       minimumDate: Calendar.current.date(byAdding: .year, value: -1,
                        to: server.date),
                       maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: server.date),
                      displayedComponents: .date)
        }
            .navigationBarTitle(Text("Date Picker"))
    }
}

class DateServer: BindableObject {
    var didChange = PassthroughSubject<DateServer, Never>()
    var date: Date = Date() {
        didSet {
            didChange.send(self)
            print("Date Changed \(date)")
        }
    }
}

#if DEBUG
struct DatePickerView_Previews : PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
#endif
