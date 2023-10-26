//
//  ContentView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-19.
//

import SwiftUI

struct ContentView: View {
    @State var categorisedParts: [String? : [Part]] = [:]
    @State var searchTerm = ""
    
    var filteredCategories: [String? : [Part]] {
        
        if searchTerm.isEmpty { return categorisedParts }
        
        return categorisedParts.filter { $0.key?.localizedCaseInsensitiveContains(searchTerm) ?? false }
    }
    
    private let adaptiveColumns = [
        GridItem(.fixed(160), spacing: 32, alignment: .top),
        GridItem(.fixed(160), alignment: .top)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 20) {
                    ForEach(Array(filteredCategories.keys), id: \.self) { category in
                        NavigationLink {
                            CategoryInfoView(parts: filteredCategories[category])
                        } label: {
                            CategoryCardView(title: category ?? "")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Our Products")
        }
        .onAppear(perform: {
            loadJson(filename: "AutoParts")
        })
        .padding()
        .searchable(text: $searchTerm, prompt: "Search for the Part / OEM Number")
    }
    
    func loadJson(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let parsedParts = try decoder.decode([Part].self, from: data)
                
                let categorisedParts = Dictionary(grouping: parsedParts, by: { $0.category })
                
                DispatchQueue.main.async {
                    self.categorisedParts = categorisedParts
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
