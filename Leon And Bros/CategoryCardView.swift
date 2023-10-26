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
        VStack(spacing: 0) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.black)
                .background(Theme.CustomColor.secondaryColor)
            
            Text("View Products")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Theme.CustomColor.primaryColor)
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(title: "Title")
    }
}

