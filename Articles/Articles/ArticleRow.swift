//
//  ArticleRow.swift
//  Articles
//
//  Created by chams on 06/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import SwiftUI

struct ArticleRow : View {
    var article: Article
    
    var body: some View {
        HStack {
            article.image(forSize: 50)
            VStack(alignment: .leading) {
                HStack {
                    Text(article.title)
                        .font(.headline)
                    Spacer()
                    Text(article.dateFormatted)
                }
                Text(article.preview)
                    .font(.subheadline)
            }
        }
    }
}

#if DEBUG
struct ArticleRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ArticleRow(article: articleData[0])
            ArticleRow(article: articleData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
