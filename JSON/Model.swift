//
//  Model.swift
//  JSON
//
//  Created by Mr. Naveen Kumar on 15/12/20.
//

import Foundation
struct Model: Decodable{
    let Data: [DataItem]
}

struct DataItem: Decodable {
    let title: String
    let items: [String]
}
