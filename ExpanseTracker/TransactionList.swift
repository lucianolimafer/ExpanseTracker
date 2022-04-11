//
//  TransactionList.swift
//  ExpanseTracker
//
//  Created by Luciano Lima on 10/04/22.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                // MARK: Transaction List
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        // MARK: Transaction List
                        ForEach(transactions) {transaction in
                            TransactionRow(transaction: transaction)
                                .overlay(
                                    NavigationLink("", destination: {
                                        TransactionView(transaction: transaction)
                                    })
                                        .opacity(0)
                                )
                            ZStack {
                                TransactionRow(transaction: transaction)
                                NavigationLink("", destination: {
                                    TransactionView(transaction: transaction)
                                })
                                    .opacity(0)
                            }
                        }
                    } header: {
                        // MARK: Transaction month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transações")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
