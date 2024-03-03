//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func logUser() async throws {
        try await AuthService.shared.login(withEmail: email, withPassword: password)
    }
}
