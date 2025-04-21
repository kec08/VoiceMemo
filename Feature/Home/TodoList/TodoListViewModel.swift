//
//  TodoListViewModel.swift
//  voiceMemo
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo]
    @Published var isEditTodoMede: Bool
    @Published var removeTodos: [Todo]
    @Published var isDisplayRemoveTodoAlert: Bool
    
    var reomveTodoCount: Int {
        return removeTodos.count
    }
    var navigationBarRightBtnMode: NavigationBtnType {
        isEditTodoMede ? .complete : .edit
    }
    
    init(todos: [Todo] = [],
         isEditModeTodoMede: Bool = false,
         removeTodos: [Todo] = [],
         isDisplayRemoveTodoAlert: Bool = false
    ) {
        self.todos = todos
        self.isEditTodoMede = isEditModeTodoMede
        self.removeTodos = removeTodos
        self.isDisplayRemoveTodoAlert = isDisplayRemoveTodoAlert
    }
    
}
extension TodoListViewModel {
    func selectedBoxTapped(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0 == todo }) {
            todos[index].selected.toggle()
        }
    }
    
    func addTodo(_ todo: Todo) {
        todos.append(todo)
    }
    
    func navigationRightBtnTapped() {
        if isEditTodoMede {
            if removeTodos.isEmpty {
                isEditTodoMede = false
            } else {
                setIsDisplayRemoveTodoAlert(true)
            }
        } else {
            isEditTodoMede = true
        }
    }
    
    func setIsDisplayRemoveTodoAlert(_ isDisplay: Bool) {
        isDisplayRemoveTodoAlert = isDisplay
    }
    
    func todoRemoveSelectdBoxTapped(_ todo: Todo) {
        if let index = removeTodos.firstIndex(of: todo) {
            removeTodos.remove(at: index)
        } else {
            removeTodos.append(todo)
        }
    }
    
    func removeBtnTapped() {
        todos.removeAll { todo in
            removeTodos.contains(todo)
        }
        removeTodos.removeAll()
        isEditTodoMede = false
    }
}
