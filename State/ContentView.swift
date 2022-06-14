//
//  ContentView.swift
//  State
//
//  Created by Mark Edmunds on 13/06/2022.
//

import SwiftUI

//struct Todo: Identifiable {
//  let id: String
//  let text: String
//  var isComplete: Bool
//
//  init(id: String = UUID().uuidString, text: String, isComplete: Bool) {
//    self.id = id
//    self.text = text
//    self.isComplete = isComplete
//  }
//
//  mutating func toggleComplete() {
//    isComplete = !isComplete
//  }
//}

class Todo: Identifiable, ObservableObject {
  let id: String
  let text: String
  var isComplete: Bool {
    willSet {
      objectWillChange.send()
    }
  }
  
  init(id: String = UUID().uuidString, text: String, isComplete: Bool) {
    self.id = id
    self.text = text
    self.isComplete = isComplete
  }
  
  func toggleComplete() {
    self.isComplete = !isComplete
  }
}

struct ContentView: View {
  @State var todoItems = [
    Todo(text: "Task 1", isComplete: false),
    Todo(text: "Task 2", isComplete: false),
    Todo(text: "Task 3", isComplete: true),
    Todo(text: "Task 4", isComplete: false),
    Todo(text: "Task 5", isComplete: true),
  ]
  
  var body: some View {
    VStack {
      //      ForEach(todoItems) { todoItem in
      ForEach(0..<todoItems.count) { index in
        HStack {
          Text(todoItems[index].text)
          Spacer()
          Button {
            // todoItems[index] = Todo(text: todoItems[index].text, isComplete: !todoItems[index].isComplete) // works when class
            // todoItems[index].isComplete = !todoItems[index].isComplete
            todoItems[index].toggleComplete()
          } label: {
            Text("Click Me")
          }
          Spacer()
          Text(todoItems[index].isComplete ? "Complete" : "Incomplete")
        }
        .padding(.vertical, 10)
      }
      
      //      Button {
      //        // todoItems[0] = Todo(text: "Task 1", isComplete: true) // works when class
      //        // todoItems[0].isComplete = true
      //        // todoItems[0].toggleComplete()
      //      } label: {
      //        Text("Click Me")
      //      }
    }
    .padding(.horizontal)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
