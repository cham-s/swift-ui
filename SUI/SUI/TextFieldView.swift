//
//  TextFieldView.swift
//  SUI
//
//  Created by chams on 09/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct TextFieldView : View {
    @State var name: String = ""
    @State var password: String = ""
    @State var editing = false
    
    let nameText = Text("username").color(.secondary).font(.system(size: 16))
    let passText = Text("password").color(.secondary).font(.system(size: 16))
    
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("username:").color(.secondary)
                TextField(self.$name, placeholder: self.nameText, onEditingChanged: { change in
                    print("OnEditing: \(change)")
                }) {
                    print("username: \(self.name)")
                    self.editing =  true
                }
            }
                .padding()
                .frame(height: 50)
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            HStack {
                Text("password:").color(.secondary)
                SecureField(self.$password, placeholder: self.passText) {
                    print("password: \(self.password)")
                    self.editing =  true
                }
            }
                .padding()
                .frame(height: 50)
                .textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            
                .offset(y: -150)
                .navigationBarTitle(Text("TextField"))
    }
}

#if DEBUG
struct TextFieldView_Previews : PreviewProvider {
    
 
    
    static var previews: some View {
        TextFieldView()
    }
}
#endif
