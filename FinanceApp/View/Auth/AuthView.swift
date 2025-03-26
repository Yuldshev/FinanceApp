import SwiftUI

struct AuthView: View {
  @State private var isLink = false
  
  var body: some View {
    NavigationStack {
      VStack {
        Text("Welcome")
          .font(.system(size: 34, weight: .bold))
          .padding(.bottom, 8)
        
        Text("Finance and banking app, please login to your account for you check and balance.")
          .multilineTextAlignment(.center)
          .lineLimit(2)
        
        CustomButton(title: "Login", action: { isLink = true })
        .padding(.top, 50)
        
        Text("Don't have an account? **SignUp**")
          .font(.callout)
          .padding(.top, 29)
      }
      .padding(.vertical, 20)
      .padding(.horizontal, 24)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
      .navigationDestination(isPresented: $isLink) {
        LoginView()
      }
    }
  }
}

#Preview {
  AuthView()
}

