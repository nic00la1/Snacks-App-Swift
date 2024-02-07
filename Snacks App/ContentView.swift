//
//  ContentView.swift
//  Snacks App
//
//  Created by Nicola Kaleta on 06/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Home()
                .environmentObject(cartManager)
            
            if cartManager.products.count > 0 {
                HStack(spacing: 30) {
                    Text("\(cartManager.products.count)")
                        .padding()
                        .background(.yellow)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.black)
                    
                    VStack(alignment: .leading) {
                        Text("Cart")
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("\(cartManager.products.count) Items")
                            .font(.system(size: 18))
                    }
                    Spacer()
                    
                    ForEach(cartManager.products, id: \.name) { product in
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .frame(width: 60, height: 60)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.leading, -60)
                        
                    }
                }
                .padding(30)
                .frame(width: .infinity, height: 80)
                .background(.black)
                .foregroundStyle(.white)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
