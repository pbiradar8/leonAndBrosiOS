//
//  CategoryInfoView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-26.
//

import SwiftUI

struct CategoryInfoView: View {
    @State var parts: [Part]? = []
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    if !(parts?.isEmpty ?? true), let partCount = parts?.count {
                        ForEach(0..<partCount) { i in
                            PartDescriptionView(part: parts?[i])
                        }
                    }
                }
                .padding()
            }
            .frame(alignment: .top)

            Spacer()
        }
    }
}

#Preview {
    CategoryInfoView(parts: [Part(agPartNumber: "K8688-AG", photo: "https://i.ibb.co/YZVbZWt/ES800973.png", moogNumber: "", oemNumber: "", application: "", category: "")])
        .previewLayout(.sizeThatFits)
}

struct PartDescriptionView: View {
    let part: Part?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: part?.photo ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400, maxHeight: 400)
            } placeholder: {
                ProgressView()
                    .controlSize(.extraLarge)
                    .frame(maxWidth: 400, maxHeight: 400)
            }
            
            Text(part?.agPartNumber ?? "")
                .foregroundStyle(.white)
            
            HStack {
                HStack {
                    (Text("4.5 ") + Text(Image(systemName: "star")))
                }
                .foregroundStyle(.white)
                
                Text("(36,177)")
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background(.gray)
    }
}
