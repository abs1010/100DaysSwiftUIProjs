//
//  ContentView.swift
//  iExpense
//
//  Created by Alan Silva on 11/03/21.
//

import SwiftUI

//PUBLISHED / OBSERVEDOBJECT / OBERVABLEOBJECT PROTOCOL
/*
 
 class User: ObservableObject {
 @Published var firstName = "Bilbo"
 @Published var lastName = "Baggins"
 }
 
 struct ContentView: View {
 
 @ObservedObject private var user = User()
 
 var body: some View {
 VStack {
 Text("Your name is \(user.firstName) \(user.lastName).")
 
 TextField("First name", text: $user.firstName)
 TextField("Last name", text: $user.lastName)
 }
 }
 }
 
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 
 //#################################################################################
 
 //ENVIRONMENT / SHEET
 
 struct SecondView: View {
 
 @Environment(\.presentationMode) var presentationMode
 
 var name: String
 
 var body: some View {
 Button("Dismiss") {
 self.presentationMode.wrappedValue.dismiss()
 print(name)
 }
 //Color(UIColor.red.cgColor)
 //Text("Second View")
 }
 }
 
 struct ContentView: View {
 
 @State private var showingSheet = false
 
 var body: some View {
 Button("Show Sheet") {
 self.showingSheet.toggle()
 }.sheet(isPresented: $showingSheet, content: {
 SecondView(name: "Alan")
 })
 }
 }
 
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 
 */

//#################################################################################


//struct ContentView: View {
//
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//
//        NavigationView {
//
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }.listStyle(GroupedListStyle())
//
//                Button("Add Number") {
//                    self.numbers.append(self.currentNumber)
//                    self.currentNumber += 1
//                }
//
//            }
//
//            .navigationBarItems(leading: EditButton())
//
//        }
//
//    }
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//
//}


struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items) { item in /// Since Expenses conform to Identifiable protocol we dont need ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeRows)// { indexSet in
                //removeRows(at: indexSet)
                //})
            }.listStyle(GroupedListStyle())
            .navigationTitle("iExpense")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddExpense = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
        
    }
    
    //func addObj() {
    //    expenses.items.append(ExpenseItem(name: "teste", type: "car", amount: 20))
    //}
    
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
