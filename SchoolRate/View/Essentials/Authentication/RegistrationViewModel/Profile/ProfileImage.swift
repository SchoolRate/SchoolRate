//

import SwiftUI
import Kingfisher

struct ProfileImage: View {
    @Environment(\.colorScheme) var colorScheme
    var user: User?
    @StateObject var profileModel = EditProfileViewModel()
    
    var body: some View {
        if let imageUrl = user?.profileImageURL {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: 70, height: 60)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .background {
                    Circle().fill(
                        LinearGradient(
                            colors: colorScheme == .dark ? [.white, .gray] : [.black, .gray],
                            startPoint: .top,
                            endPoint: .bottom
                        )
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

#Preview {
    ProfileImage()
}
