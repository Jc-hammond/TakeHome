//
//  LoginView.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    @State var currentUser = User(username: "ConnorH1", name: "Connor H", password: "password")
    @State var username: String = ""
    @State var password: String = ""
    @State var isPresented = false
    @State var willMoveToHomeView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                VStack {
                    
                    LogoView()
                        .offset(y: -18)
                    
                    VStack(spacing: 10) {
                        TextField("Username", text: $username)
                            .padding(10)
                            .font(Font.system(size: 21, weight: .medium))
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        .foregroundColor(.blue)
                        .frame(width: 309, height: 56)
                        
                        SecureField("Password", text: $password)
                            .padding(10)
                            .font(Font.system(size: 21, weight: .medium))
                            .background(RoundedRectangle(cornerRadius: 20))
                            .foregroundColor(.white)
                            .frame(width: 309, height: 56)
                    }
      
                    Button {

                        if viewModel.checkCredentials(username: username, password: password) {
                            willMoveToHomeView = true
                           
                        } else {
                            isPresented = true
                        }

                    } label: { CustomButton(title: "Login") }
                    .alert("Login Error", isPresented: $isPresented) {
                        Button("OK", role: .cancel) { isPresented = false }
                    }
                                    
                    LineView()
                    
                    Button {
                        
                    } label: { CustomButton(title: "Register") }
                }
                .background(NavigationLink(destination: HomeView(currentUser: $currentUser), isActive: $willMoveToHomeView) { })
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct CustomTextField: View {
    
    let fontsize: CGFloat = 21
    let backgroundColor = Color.blue
    let textColor = Color.white
    
    @Binding var field: String
    @State var isHighlighted = false
    
    var body: some View {
        TextField(field, text: $field)
            .font(Font.system(size: fontsize))
            .padding()
            .background(RoundedRectangle(cornerRadius: 20))
            .foregroundColor(textColor)
            .padding()
    }
}


struct LogoView: View {
    var body: some View {
        VStack {
            StarView()
            
            Text("App Name")
                .font(Font.system(size: 32, weight: .medium))
                .foregroundColor(.white)
        } .offset(y: -91)
    }
}

struct LineView: View {
    var body: some View {
        Rectangle().fill(Color.white).frame(width: 289, height: 2).padding()
    }
}
