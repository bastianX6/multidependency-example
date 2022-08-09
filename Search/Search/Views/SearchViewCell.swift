//
//  SearchViewCell.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchViewCell: View {
    let model: SearchCellModel

    var body: some View {
        HStack {
            WebImage(url: self.model.coverUrl)
                .resizable()
                .placeholder(Image(systemName: "play.circle.fill"))
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(25)
            VStack {
                Text(self.model.songName)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .leading)
                Text(self.model.artistName)
                    .bold()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .leading)
            }
        }
    }
}
