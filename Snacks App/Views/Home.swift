//
//  Home.swift
//  Snacks App
//
//  Created by Nicola Kaleta on 06/02/2024.
//

import SwiftUI

struct Home: View {
    
    // Category View Properties
    @State var selectedCategory = ""
    
    var body: some View {
        ScrollView {
            VStack {
                // Header
                HStack {
                    Text("Order From The Best OF **Snacks**")
                        .font(.system(size: 36))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 70, height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                }
                .padding(23)
                
                // Category List
                CategoryListView
                
                // Collection View
                HStack {
                    Text("Choco **Collections**")
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                
                // Product List
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(productList, id: \.id) { item in
                            ProductCard(product: item)
                        }
                    }
                }
            }
        }
    }
    
    
    // Category List View
    var CategoryListView: some View {
        HStack  {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(item.icon)
                                        .resizable()
                                        .frame(width: 32.0, height: 32.0)
                                        .foregroundStyle(selectedCategory == item.title ? .yellow : .black)
                                }
                                
                                
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black.opacity(0.7) : .gray.opacity(0.1))
                            .foregroundStyle(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
}

// Product Card View
struct ProductCard: View {
    var product: Product
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .frame(maxWidth: 320)
                .frame(maxHeight: 330)
                .scaledToFill()
                .padding(.trailing, -100)
                .rotationEffect(Angle(degrees: 1 ))
            
            ZStack {
                
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                    
                    Text("\(product.category)")
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                        }
                        
                    }
                    .padding()
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                    
                    
                })
            }
            
            .padding(30)
            .frame(width: 336, height: 422)
            .background(product.color.opacity(0.13))
            .clipShape(.rect(cornerRadius: 57))
            .padding(.leading, 20)
        }
    }
}
