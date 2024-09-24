//
//  TaskViewModel.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//


import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    var appEnvironment = AppEnvironment.shared;
    
    func fetchTasks() {
        guard let url = URL(string: "\(appEnvironment.getAPILink())/tasks") else { return }
        
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchData(from: url) { (result: Result<[Task], Error>) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let tasks):
                    self.tasks = tasks
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
