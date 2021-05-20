//
//  News.swift
//  LoadImage JSON
//
//  Created by MacBook on 08/02/21.
//

import Foundation

struct News : Identifiable {
    let id = UUID()
    let title : String
    let description : String
    let image : String
}
