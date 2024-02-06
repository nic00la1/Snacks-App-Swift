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
                // Category List
                CategoryListView
                
            }
            .padding(30)
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
                                Image(item.icon)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Home()
}
