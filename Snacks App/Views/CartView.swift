//
//  CartView.swift
//  Snacks App
//
//  Created by Nicola Kaleta on 06/02/2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header
                    HStack {
                        Text("Cart")
                            .font(.system(size: 36))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("3")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundStyle(.black)
                        
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4)
                                }
                                .foregroundStyle(.black)
                        }
                    }
                    .padding(23)
                    
                    // Cart Products
                    VStack(spacing: 20) {
                        ForEach(productList) { item in
                         CartProductCard(product: item)
                         }
                    }
                    .padding(.horizontal)
                    
                     
                    // Total Amount
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Delivery Amount")
                            Spacer()
                            Text("$4.00")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Amount")
                            .font(.system(size: 24))
                        
                        Text("USD 38.00")
                            .font(.system(size: 36, weight: .semibold))
                        
                    }
                    .padding(30)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.yellow.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    . padding()
                    
                    // Button to Make Payment
                    
                    Button {
                        
                    } label: {
                        Text("Make Payment")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

// Cart Product View
struct CartProductCard: View {
    
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Capsule())
            
            VStack(alignment: .leading, content:  {
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
            
        }
    }
}
