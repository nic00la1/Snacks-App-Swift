//
//  ProductModel.swift
//  Snacks App
//
//  Created by Nicola Kaleta on 06/02/2024.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products
var productList = [
    Product(name: "Wilde Chips", category: "Chips", image: "image 1",color: .pink, price: 8),
    Product(name: "Apple Chips", category: "Chips", image: "image 2",color: .yellow, price: 8),
    Product(name: "Sea Chips", category: "Chips", image: "image 3", color: .red, price: 8),
    Product(name: "Crazy Chippers", category: "Chips", image: "image 4",color: .green,price: 8),
    Product(name: "Layzz Strong", category: "Chips", image: "image 5", color: .blue, price: 8),
    Product(name: "Joy Days", category: "Choco", image: "image 6",color: .brown ,price: 8),
    Product(name: "Granola Yumm'ë", category: "Choco", image: "image 7",color: .orange,price: 8),
    Product(name: "Choco Brownie", category: "Choco", image: "image 8", color: .purple,price: 8)
]
