//
//  PreviewData.swift
//  ExpanseTracker
//
//  Created by Luciano Lima on 09/04/22.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "22/01/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "credit", categoryId: 801, category: "Software", isPending: false, isTrasnfer: false, isExpanse: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)

