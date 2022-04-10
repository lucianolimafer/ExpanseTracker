//
//  ExpanseTrackerApp.swift
//  ExpanseTracker
//
//  Created by Luciano Lima on 09/04/22.
//

import SwiftUI

@main
struct ExpanseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
