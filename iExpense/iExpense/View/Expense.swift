//
//  Expense.swift
//  iExpense
//
//  Created by Alan Silva on 20/03/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let name: String
    let type: String
    let amount: Int
    var id = UUID()
}

class Expenses: ObservableObject {
    
    @Published var items = [ExpenseItem]() {
        didSet {
            
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        
        if let data = UserDefaults.standard.data(forKey: "Items") {
            
            let decoder = JSONDecoder()
            
            if let _items = try? decoder.decode([ExpenseItem].self, from: data) {
            
                self.items = _items
                
                return
                
            }
            
        }
        
        self.items = []
        
    }
    
}
