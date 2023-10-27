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
        VStack(alignment: .center, spacing: 0) {
            NavigationLink {
                if let part = part {
                    PartDetailedDescriptionView(part: part)
                } else {
                    EmptyView()
                }
            } label: {
                VStack(alignment: .center, spacing: 0) {
                    AsyncImage(url: URL(string: part?.photo ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 300)
                    } placeholder: {
                        ProgressView()
                            .controlSize(.extraLarge)
                            .frame(maxWidth: 300, maxHeight: 300)
                            .tint(Theme.CustomColor.primaryColor)
                    }
                    .padding(5)
                    
                    VStack(alignment: .center) {
                        Text(part?.agPartNumber ?? "")
                            .bold()
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Theme.CustomColor.secondaryColor)
                    
                    Text("Know More")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Theme.CustomColor.primaryColor)
                }
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Theme.CustomColor.secondaryColor)
        )
    }
}

#Preview {
    PartDescriptionView(part: Part(agPartNumber: "K8688-AG", photo: "https://i.ibb.co/YZVbZWt/ES800973.png", moogNumber: "", oemNumber: "K8688, SBK8688", application: "", category: ""))
}
