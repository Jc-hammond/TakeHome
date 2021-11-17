//
//  LoginViewModel.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    
    @Published var user = User(username: "connorH1", name: "Connor H", password: "password")
    @Published var alertItem: AlertItem? 
    @Published var isCorrectLogin = false
    
    
    func checkCredentials(username: String, password: String) -> Bool {
        if username == user.username && password == user.password {
            return true
        } else {
            return false
        }
    }
    
}


