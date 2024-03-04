//

import SwiftUI
import PhotosUI
import Kingfisher

struct EditProfileView: View {
    @State private var bio = ""
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var isPrivate = false
    
    @Environment(\.openURL) private var openURL
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var viewModel = EditProfileViewModel()
    @StateObject var userModel = ProfileModel()
    
    var user: User? {
        return userModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        HStack {
                            Spacer()
                            
                            PhotosPicker(selection: $viewModel.selectedItem) {
                                if let image = viewModel.profileImage {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                } else {
                                    if let imageUrl = user?.profileImageURL {
                                        KFImage(URL(string: imageUrl))
                                            .cacheMemoryOnly()
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 130, height: 130)
                                            .background {
                                                Circle().fill(
                                                    // swiftlint:disable line_length
                                                    LinearGradient(
                                                        colors: colorScheme == .dark ? [.white, .gray] : [.black, .gray],
                                                        startPoint: .top,
                                                        endPoint: .bottom
                                                    )
                                                    // swiftlint:enable line_length
                                                )
                                            }
                                            .overlay(alignment: .bottomTrailing) {
                                                Image(systemName: "pencil.circle.fill")
                                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                                    .font(.system(size: 30))
                                            }
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.clear)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Annuler") {
                                dismiss()
                            }
                            .font(.system(size: 20, weight: .regular, design: .default))
                            .foregroundStyle(.black)
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Valider") {
                                Task {
                                    viewModel.username = username
                                    try await viewModel.updateImageData()
                                    try await viewModel.nicknameDataUpdate()
                                    dismiss()
                                }
                            }
                            .disabled(username.count < 6 && password.isEmpty && bio.isEmpty && !email.isValidEmail())
                            .font(.system(size: 20, weight: .regular, design: .default))
                            .tint(.black)
                        }
                    }
                    
                    Section(header: Text("Profil")) {
                        TextField("Nom d'utilisateur",
                                  text: $username,
                                  prompt: Text("\(user?.username ?? "Nom d'utilisateur")"))
                        
                        TextField("À propos de moi",
                                  text: $bio,
                                  prompt: Text("\(user?.bio ?? "À propos de moi")"))
                        
                        Toggle(isOn: $isPrivate) {
                            Text("Profil privé")
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundStyle(.tertiary)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: colorScheme == .dark ? .gray : .black))
                    }
                    
                    Section(header: Text("Personnel")) {
                        TextField("Adresse email",
                                  text: $email,
                                  prompt: Text("\(user?.email ?? "Adresse e-mail")"))
                        .textInputAutocapitalization(.never)
                        
                        SecureField("Mot de passe",
                                    text: $password,
                                    prompt: Text("Mot de passe"))
                    }
                    
                    Section(header: Text("Général")) {
                        Text("Version de l'app: 1.0")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundStyle(.tertiary)
                        
                        Button {
                            
                        } label: {
                            Text("Signaler un problème")
                                .foregroundStyle(.red)
                        }
                        
                        Button {
                            openURL(URL(string: "https://schoolrate.hosterfy.fr/legal-notice/")!)
                        } label: {
                            Text("Conditions générales")
                                .foregroundStyle(.blue)
                        }
                        
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Text("Se déconnecter")
                                .foregroundStyle(.red)
                        }
                        .buttonStyle(.borderless)
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
            }
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        guard !self.lowercased().hasPrefix("mailto:") else {
            return false
        }
        guard let emailDetector
                = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        let matches
        = emailDetector.matches(in: self,
                                options: NSRegularExpression.MatchingOptions.anchored,
                                range: NSRange(location: 0, length: self.count))
        guard matches.count == 1 else {
            return false
        }
        return matches[0].url?.scheme == "mailto"
    }
}

#Preview {
    EditProfileView()
}
