//
//  Alert.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidLogin = AlertItem(title: Text("Invalid Login"),
                                        message: Text("Username and/or password may be incorrect. Please try again"),
                                        dismissButton: .default(Text("Ok")))
}
