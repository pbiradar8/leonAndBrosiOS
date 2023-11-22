//
//  PartDetailedDescriptionView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-10-27.
//

import SwiftUI
import Kingfisher

struct PartDetailedDescriptionView: View {
    let part: Part
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                KFImage(URL(string: part.photo ?? ""))
                    .placeholder({ _ in
                        ProgressView()
                            .controlSize(.extraLarge)
                            .frame(maxWidth: 300, maxHeight: 300)
                            .tint(Theme.CustomColor.primaryColor)
                    })
                    .cacheOriginalImage()
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Theme.CustomColor.secondaryColor)
                    )

                VStack {
                    Text("OEM Numbers:")
                        .bold()
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(part.oemNumber ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Application Numbers:")
                        .bold()
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(part.application ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.caption)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
        }
        .frame(alignment: .top)
        .navigationTitle(part.agPartNumber ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PartDetailedDescriptionView(part: Part(agPartNumber: "K8688-AG", photo: "https://i.ibb.co/YZVbZWt/ES800973.png", moogNumber: "", oemNumber: "K8688, SBK8688", application: "FORD\tCROWN VICTORIA\t1995-2002\nLINCOLN\tTOWN CAR\t1995-2002\nMERCURY\tGRAND MARQUIS\t1995-2002", category: ""))
}
