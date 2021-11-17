//
//  CustomButton.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20).fill(.white)
                .frame(width: 309, height: 52)
            
            Group {
                Text(title)
                .font(Font.system(size: 21))
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 46)
            }
            .background(Color.blue)
            .cornerRadius(20)
            
        }
    }
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Login")
    }
}
