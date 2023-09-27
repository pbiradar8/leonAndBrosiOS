//
//  ContentView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-19.
//

import SwiftUI

struct ContentView: View {
    @State var categorisedParts: [String? : [Part]] = [:]
    
    private let adaptiveColumns = [
        GridItem(.fixed(160), spacing: 32, alignment: .top),
        GridItem(.fixed(160), alignment: .top)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 20) {
                    ForEach(Array(categorisedParts.keys), id: \.self) { category in
                        NavigationLink {
                            CategoryInfoView(parts: categorisedParts[category])
                        } label: {
                            CategoryCardView(title: category ?? "")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Categories")
        }
        .onAppear(perform: {
            loadJson(filename: "AutoParts")
        })
        .padding()
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
