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
                .bold()
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
                .background(Theme.CustomColor.secondaryColor)
            
            Button {
                
            } label: {
                Text("View Products")
                    .frame(maxWidth: .infinity)
                    .padding()
//                    .frame(width: 200, height: 100)
                    .background(Theme.CustomColor.primaryColor)
                    .foregroundColor(.white)
            }

        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(title: "Title")
    }
}

