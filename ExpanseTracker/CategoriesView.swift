//
//  CategoriesView.swift
//  ExpanseTracker
//
//  Created by Luciano Lima on 11/04/22.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            ForEach(Category.categories) { category in
                Section {
                    // MARK: Sub Categories
                    ForEach(category.subCategories ?? []) { subCategory in
                        let isSelected = transaction.categoryId == subCategory.id
                        
                        CategoryRow(category: subCategory, isSelected: isSelected)
                    }
                    
                } header: {
                    // MARK: Categories
                    let isSelected = transaction.categoryId == category.id
                    
                    CategoryRow(category: category, isSelected: isSelected)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Categoria")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesView(transaction: transactionPreviewData)
            CategoriesView(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
