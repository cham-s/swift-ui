//
//  WebImage.swift
//  SUI
//
//  Created by chams on 10/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct WebImage : View {
    @State private var image: UIImage? = nil
    let placeholderImage = UIImage(systemName: "cloud.fill")!
    
    var body: some View {
        Image(uiImage: self.image ?? placeholderImage)
            .onAppear(perform: downloasWebImage)
            .aspectRatio(contentMode: .fit)
            .tapAction {
                print("Tap ")
        }
    }
    
    func downloasWebImage() {
        guard let url = URL(string: "https://cn.opendesktop.org/img/a/f/2/e/fed03968e00fabb45b1249a421012db091a2.png") else {
            print("Invalid URL.")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.image = image
            } else {
                print("error: \(String(describing: error))")
            }
        }.resume()
    }
}

#if DEBUG
struct WebImage_Previews : PreviewProvider {
    static var previews: some View {
        WebImage()
    }
}
#endif
