import SwiftUI

struct LoginView: View {
  @State private var login: String = ""
  @State private var password: String = ""
  @State private var isHide = false
  @State private var isValid = false
  @State private var isLink = false
  @State private var errorMessage = false
  
  var body: some View {
    VStack {
      customTextField(title: "Login", text: $login, isSecure: false)
      customTextField(title: "Password", text: $password, isSecure: !isHide)
        .overlay(alignment: .trailing) {
          eyeButton
        }
        .padding(.top, 22)
      
      signInButton
        .padding(.top, 100)
        .padding(.bottom, 50)
    }
    .overlay(errorOverlay)
    .padding(.horizontal, 24)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .navigationBarBackButtonHidden()
    .navigationDestination(isPresented: $isLink) {
      HomeView()
    }
  }
  
  private func customTextField(title: String, text: Binding<String>, isSecure: Bool) -> some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.system(size: 12))
        .opacity(0.8)
      
      if isSecure {
        SecureField("", text: text)
          .font(.headline)
      } else {
        TextField("", text: text)
          .font(.headline)
      }
    }
    .frame(height: 64)
    .padding(.horizontal, 16)
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(errorMessage ? .red : .white.opacity(0.4), lineWidth: 1)
    }
  }
  
  private var eyeButton: some View {
    Button {
      isHide.toggle()
    } label: {
      Image(systemName: isHide ? "eye.slash.fill" : "eye.fill")
        .foregroundStyle(.white)
    }
    .padding(.trailing, 16)
  }
  
  private var signInButton: some View {
    Button {
      if login.lowercased() == "admin" && password.lowercased() == "admin" {
        isValid = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          isLink = true
          isValid = false
        }
      } else {
        errorMessage = true
      }
    } label: {
      Group {
        if isValid {
          ProgressView()
        } else {
          Text("SignUp")
        }
      }
      .font(.headline)
      .foregroundStyle(.white)
      .frame(maxWidth: .infinity)
      .frame(height: 60)
      .background(.accent)
      .clipShape(RoundedRectangle(cornerRadius: 16))
    }
  }
  
  private var errorOverlay: some View {
    Group {
      if errorMessage {
        Text("Invalid login / password")
          .foregroundStyle(.red)
      }
    }
  }
}

#Preview {
  LoginView()
}
