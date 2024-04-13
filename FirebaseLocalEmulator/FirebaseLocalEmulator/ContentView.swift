//
//  ContentView.swift
//  FirebaseLocalEmulator
//
//  Created by Mayank Choudhary on 13/04/24.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if((error == nil)) {
                print(result!.user.email!)
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            TextField("Email", text: $email)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding(12)
            SecureField("Password", text: $password)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding(12)

            Button(action: {
                signUp()
                }) {
                Text("Signup")
                        .frame(maxWidth: .infinity)
                        .padding(12)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                   }
                   .padding()
                   
                   Spacer()
               }
        .padding()
    }
}

#Preview {
    ContentView()
}
