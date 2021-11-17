//
//  HomeViewModel.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var name: String
    
    init(name: String) {
        self.name = name
    }
    
}
