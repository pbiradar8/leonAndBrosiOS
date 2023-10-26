//
//  PartDescriptionView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-10-26.
//

import SwiftUI

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
                .bold()
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

#Preview {
    PartDescriptionView(part: Part(agPartNumber: "K8688-AG", photo: "https://i.ibb.co/YZVbZWt/ES800973.png", moogNumber: "", oemNumber: "", application: "", category: ""))
}
