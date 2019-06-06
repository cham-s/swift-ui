//
//  ArticleListView.swift
//  Articles
//
//  Created by chams on 06/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ArticleListView : View {
    var body: some View {
        NavigationView {
            List(articleData) { article in
                    ArticleRow(article: article)
            }
        }
        .navigationBarTitle(Text("Articles"))
    }
}

#if DEBUG
struct ArticleListView_Previews : PreviewProvider {
    
    static var previews: some View {
        ArticleListView()
    }
}
#endif
