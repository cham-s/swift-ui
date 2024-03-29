//
//  ListView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ListView : View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationButton(destination: TextView()) {
                    Text("Text")
                }
                NavigationButton(destination: TextFieldView()) {
                    Text("TextField")
                }
                NavigationButton(destination: ImageView()) {
                    Text("Image")
                }
                NavigationButton(destination: WebImage()) {
                    Text("Web Image")
                }
                NavigationButton(destination: ButtonView()) {
                    Text("Button")
                }
                NavigationButton(destination: NavigationButtonView()) {
                    Text("Navigation Button")
                }
                NavigationButton(destination: PresentationButtonView()) {
                    Text("Presentation Button")
                }
                NavigationButton(destination: EditButtonView()) {
                    Text("Edit Button View")
                }
                NavigationButton(destination: PickerView()) {
                    Text("Picker View")
                }
                NavigationButton(destination: DatePickerView()) {
                    Text("Date Picker")
                }
                NavigationButton(destination: SliderUIView) {
                    Text("Slider")
                }
            }
            .navigationBarTitle(Text("SwiftUI Tutorials"))
        }
    }
}

#if DEBUG
struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
#endif
