//
//  CategoryCardView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-26.
//

import SwiftUI

struct CategoryCardView: View {

    let title: String

    var body: some View {
        VStack(spacing: -Theme.Size.cornerRadius) {
            Text(title)
                .padding()
                .bold()
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
                .background(Theme.CustomColor.secondaryColor)
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(title: "Title")
    }
}

