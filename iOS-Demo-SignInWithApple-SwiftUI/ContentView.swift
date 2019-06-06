//
//  ContentView.swift
//  iOS-Demo-SignInWithApple-SwiftUI
//
//  Created by Jaap Mengers on 05/06/2019.
//  Copyright © 2019 Jaap Mengers. All rights reserved.
//

import SwiftUI

extension CredentialsOrError {
  var isSuccess: Bool {
    switch self {
    case .credentials: return true
    case .error: return false
    }
  }
  
  var values: (user: String, givenName: String?, familyName: String?, email: String?)? {
    switch self {
    case let .credentials(user: user, givenName: givenName, familyName: familyName, email: email): return (user: user, givenName: givenName, familyName: familyName, email: email)
    case .error: return nil
    }
  }
  
  var error: Error? {
    switch self {
    case .credentials: return nil
    case .error(let error): return error
    }
  }
}

struct ContentView : View {
  @State var credentials: CredentialsOrError?
  
  var body: some View {
    VStack {
      if $credentials.value == nil {
        SignInWithAppleButton(credentials: $credentials)
      } else if $credentials.value!.isSuccess
      {
        Text("User: \($credentials.value!.values!.user)")
        Text("Given name: \($credentials.value!.values?.givenName ?? "")")
        Text("Family name: \($credentials.value!.values?.familyName ?? "")")
        Text("Email: \($credentials.value!.values?.email  ?? "")")
      } else {
        Text($credentials.value!.error!.localizedDescription)
          .color(.red)
      }
    }
  }
}
