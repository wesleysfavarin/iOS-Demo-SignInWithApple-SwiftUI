//
//  ContentView.swift
//  iOS-Demo-SignInWithApple-SwiftUI
//
//  Created by Jaap Mengers on 05/06/2019.
//  Copyright © 2019 Jaap Mengers. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  @State var credentials: Credentials?
  
  var body: some View {
    VStack {
      if $credentials.value != nil {
        Text("User: \($credentials.value?.user ?? "")")
        Text("Given name: \($credentials.value?.givenName ?? "")")
        Text("Last name: \($credentials.value?.givenName ?? "")")
        Text("Email name: \($credentials.value?.givenName ?? "")")
      } else {
        SignInWithAppleButton(credentials: $credentials)
      }
    }
  }
}
