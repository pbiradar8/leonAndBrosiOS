//
//  ContentView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-19.
//

import SwiftUI

struct ContentView: View {
    @State var allParts: [Part] = []
    @State var categorisedParts: [String? : [Part]] = [:]
    @State var searchTerm = ""
    @State var isSearchbarPresented = false
    
    var filteredParts: [Part] {
        
        if searchTerm.isEmpty { return allParts }
        
        return allParts.filter { $0.agPartNumber?.localizedCaseInsensitiveContains(searchTerm) ?? false || $0.oemNumber?.localizedCaseInsensitiveContains(searchTerm) ?? false
        }
    }
    
    private let adaptiveColumns = [
        GridItem(.fixed(160), spacing: 20, alignment: .top),
        GridItem(.fixed(160), spacing: 20, alignment: .top),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isSearchbarPresented {
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
                    LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 20) {
                        ForEach(Array(categorisedParts.keys), id: \.self) { category in
                            NavigationLink {
                                CategoryInfoView(categoryName: category ?? "", parts: categorisedParts[category])
                            } label: {
                                CategoryCardView(title: category ?? "")
                            }
                        }
                    }
                    .padding()
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Our Products")
            .searchable(text: $searchTerm, isPresented: $isSearchbarPresented, prompt: "Search for Part / OEM Number")
        }
        .onAppear(perform: {
            loadJson(filename: "AutoParts")
        })
    }
    
    func loadJson(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let parsedParts = try decoder.decode([Part].self, from: data)
                
                let categorisedParts = Dictionary(grouping: parsedParts, by: { $0.category })
                
                DispatchQueue.main.async {
                    self.allParts = parsedParts
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
