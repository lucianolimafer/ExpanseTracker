//
//  TransactionView.swift
//  ExpanseTracker
//
//  Created by Luciano Lima on 11/04/22.
//

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        List {
            VStack(spacing: 6) {
                Text(transaction.signedAmount, format: .currency(code: "BRL"))
                    .font(.largeTitle)
                    .bold()
                
                Text(transaction.merchant)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month(.wide).day())
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowSeparator(.hidden, edges: .top)
            .padding(.vertical, 16)
            
            // MARK: Merchant
            TransactionDetailRow(icon: .store, title: "Negócio", text: transaction.merchant)
            
            // MARK: Date
            TransactionDetailRow(icon: .calendar, title: "Data", text: transaction.dateParsed.formatted(.dateTime.year().month(.wide).day().weekday()))
            
            // MARK: Financial Institution
            TransactionDetailRow(icon: .landmark, title: "Instituição Financeira", text: transaction.institution)
            
            // MARK: Account
            TransactionDetailRow(icon: .credit_card, title: "Conta", text: transaction.account)
            
            // MARK: Category
            NavigationLink {
                CategoriesView(transaction: transaction)
            } label: {
                TransactionDetailRow(icon: .list, title: "Categoria", text: transaction.categoryItem.name)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Transação")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TransactionView(transaction: transactionPreviewData)
            }
            NavigationView {
                TransactionView(transaction: transactionPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
