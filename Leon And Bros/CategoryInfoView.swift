//
//  CategoryInfoView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-26.
//

import SwiftUI

struct CategoryInfoView: View {
    let categoryName: String
    
    @State var allParts: [Part] = []
    @State var searchTerm = ""
    @State var isSearchPresented = false
    
    private var currentCategoryParts: [Part] {
        return allParts.filter({ $0.category == categoryName})
    }
    
    var filteredParts: [Part] {
        if searchTerm.isEmpty { return allParts }
        
        return allParts.filter {
            $0.agPartNumber?.localizedCaseInsensitiveContains(searchTerm) ?? false ||
            $0.oemNumber?.localizedCaseInsensitiveContains(searchTerm) ?? false
        }
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 160, maximum: 300), spacing: 20, alignment: .top)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if isSearchPresented {
                if filteredParts.isEmpty {
                    Text("No parts found with the search term")
                        .padding()
                } else {
                    LazyVGrid(columns: adaptiveColumns) {
                        ForEach(filteredParts, id: \.self) { part in
                            PartDescriptionView(part: part)
                        }
                    }
                    .padding()
                }
            } else {
                LazyVGrid(columns: adaptiveColumns, content: {
                    ForEach(currentCategoryParts, id: \.self) { part in
                        PartDescriptionView(part: part)
                    }
                })
                .padding()
            }
            
        }
        .frame(alignment: .top)
        .navigationTitle(categoryName)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchTerm, isPresented: $isSearchPresented, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Part / OEM Number")
    }
}

#Preview {
    CategoryInfoView(categoryName: "Control Arm Bushing")
        .previewLayout(.sizeThatFits)
}
