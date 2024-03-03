//

import SwiftUI
import Firebase

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 280)
                
                VStack{
                    TextField("Adresse email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(LoginViewModifier())
                    
                    SecureField("Mot de passe", text: $viewModel.password)
                        .modifier(LoginViewModifier())
                }
                
                NavigationLink {
                    Text("Mot de passe oublié ?")
                } label: {
                    Text("Mot de passe oublié ?")
                        .modifier(PasswordViewModifier())
                }
                
                Button {
                    Task { try await viewModel.logUser()}
                } label: {
                    Text("Se connecter")
                        .modifier(SignInButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Vous n'avez pas de compte ?")
        
                        Text("S'inscrire")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
            .navigationTitle("SchoolRate")
        }
    }
}
                
#Preview {
    LoginView()
}
