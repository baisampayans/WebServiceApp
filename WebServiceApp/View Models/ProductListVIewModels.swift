//
//  ProductListVIewModels.swift
//  WebServiceApp
//
//  Created by Baisampayan Saha Ultra on 6/18/24.
//

import Foundation

@MainActor
class ProductListVIewModels: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProduct() async {
        do {
            let products = try await webservice.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch {
            print(error)
        }
    }
    
}


struct ProductViewModel: Identifiable {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
}
