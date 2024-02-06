//
//  CartView.swift
//  Snacks App
//
//  Created by Nicola Kaleta on 06/02/2024.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 36))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                                .foregroundStyle(.black)
                        }
                    }
                    .padding(23)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(productList, id: \.id) { item in
                            ProductCard(product: item)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    CartView()
}
