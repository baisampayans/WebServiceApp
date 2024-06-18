//
//  ContentView.swift
//  WebServiceApp
//
//  Created by Baisampayan Saha Ultra on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListVIewModels(webservice: Webservice())
    
    var body: some View {
        List(vm.products) { product in
            Text(product.title)
        }.task {
            await vm.populateProduct()   
        }
    }
}

#Preview {
    ContentView()
}
