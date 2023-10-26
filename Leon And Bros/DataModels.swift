//
//  DataModels.swift
//  Leon And Bros
//
//  Created by Pravin Biradar on 2023-09-26.
//

struct Part: Codable, Hashable {    
    let agPartNumber: String?
    let photo: String?
    let moogNumber: String?
    let oemNumber: String?
    let application: String?
    let category: String?
    
    enum CodingKeys: String, CodingKey {
        case agPartNumber = "AG Part Number",
             photo = "Photo",
             moogNumber = "Moog Number",
             oemNumber = "OEM Number",
             application = "Application",
             category = "Category"
    }
}
