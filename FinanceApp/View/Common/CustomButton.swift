import SwiftUI

struct CustomButton: View {
  var title: String
  var action: () -> Void
  
    var body: some View {
      Button(action: action) {
        Text(title)
          .font(.headline)
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity)
          .frame(height: 60)
          .background(.accent)
          .clipShape(RoundedRectangle(cornerRadius: 16))
      }
    }
}

#Preview {
  CustomButton(title: "Text", action: {})
}
