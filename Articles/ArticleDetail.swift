//
//  ArticleDetail.swift
//  Articles
//
//  Created by chams on 06/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ArticleDetail : View {
    var article: Article
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(article.title)
                .multilineTextAlignment(.leading)
            article.image(forSize: 250)
            Text(article.article)
            .lineLimit(nil)
        }
            .padding()
    }
}

#if DEBUG
struct ArticleDetail_Previews : PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: articleData[2])
    }
}
#endif
