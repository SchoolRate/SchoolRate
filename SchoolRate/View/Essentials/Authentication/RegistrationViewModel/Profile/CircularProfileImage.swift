//

import SwiftUI
import Kingfisher

struct CircularProfileImage: View {
    @StateObject var viewModel = ProfileModel()
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    @StateObject var profileModel = EditProfileViewModel()
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        if let imageUrl = user?.profileImageURL {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: 70, height: 60)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .font(.system(size: 62))
        }
    }
}

#Preview {
    CircularProfileImage()
}
