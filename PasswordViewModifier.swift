//

import SwiftUI

struct PasswordViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.vertical)
            .padding(.trailing)
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
