//
//  CategoryInfoView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-26.
//

import SwiftUI

struct CategoryInfoView: View {
    let categoryName: String
    @State var parts: [Part]? = []
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 160, maximum: 300), spacing: 20, alignment: .top),
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: adaptiveColumns, content: {
                ForEach(parts ?? [], id: \.self) { part in
                    PartDescriptionView(part: part)
                }
            })
            .padding()
        }
        .frame(alignment: .top)
        .navigationTitle(categoryName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategoryInfoView(categoryName: "", parts: [Part(agPartNumber: "K8688-AG", photo: "https://i.ibb.co/YZVbZWt/ES800973.png", moogNumber: "", oemNumber: "F5AZ3590A, F8AZ3590AA, F5AZ3590A, F8AZ3590AA, F5AZ3590A, F8AZ3590AA, F5AZ3590A, F8AZ3590AA", application: "", category: "")])
        .previewLayout(.sizeThatFits)
}
