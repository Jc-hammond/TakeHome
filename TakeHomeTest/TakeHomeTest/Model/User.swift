//
//  User.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

final class User: ObservableObject {
    
//    @Published var user = User(username: "ConnorH1", name: "Connor H", password: "password")
    
    var username: String
    var name: String
    var password: String
    
    init(username: String, name: String, password: String) {
        self.username = username
        self.name = name
        self.password = password
    }
    
}
