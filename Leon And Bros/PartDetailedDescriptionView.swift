//
//  PartDetailedDescriptionView.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-10-27.
//

import SwiftUI

struct PartDetailedDescriptionView: View {
    let part: Part
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: part.photo ?? "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 300)
                } placeholder: {
                    ProgressView()
                        .controlSize(.extraLarge)
                        .frame(maxWidth: 300, maxHeight: 300)
                }
                
                VStack {
                    Text("OEM Numbers:")
                        .bold()
                        .padding(.top)
                        .frame(maxWidth: .infinity)
                    
                    Text(part.oemNumber ?? "")
                        .frame(maxWidth: .infinity)
                    
                    Text("Application Numbers:")
                        .bold()
                        .padding(.top)
                        .frame(maxWidth: .infinity)
                    
                    Text(part.application ?? "")
                        .frame(maxWidth: .infinity)

                }
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
