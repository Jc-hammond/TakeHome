//
//  HomeView.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

struct HomeView: View {
    
//    @StateObject var viewModel = HomeViewModel()
    @Binding var currentUser: User
    @State var isReturningToLogin = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            VStack {
                LogoView()
                    .offset(y: 40)
                    .padding()
                
                VStack(spacing: 8) {
                    Text("Welcome")
                        .foregroundColor(Color.white)
                    .font(Font.system(size: 38, weight: .medium))
                    
                    Text(currentUser.name)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 38, weight: .medium))
                } .offset(y: 30)
                    
                Spacer()
                
                VStack {
                    LineView()
                    
                    Button {
                        isReturningToLogin = true
                        
                    } label: {
                        CustomButton(title: "Logout")
                    }
                }
                .background(NavigationLink(destination: LoginView(), isActive: $isReturningToLogin) {})
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentUser: .constant(User(username: "TEst", name: "test", password: "test")))
    }
}
