//
//  CategoryModel.swift
//  Snacks App
//
//  Created by Nicola Kaleta on 06/02/2024.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "choco", title: "Choco"),
    CategoryModel(icon: "waffles", title: "Waffles"),
    CategoryModel(icon: "toffee", title: "Toffee")
]
