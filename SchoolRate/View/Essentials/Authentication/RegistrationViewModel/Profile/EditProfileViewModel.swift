//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    @Published var username: String?
    
    func nicknameDataUpdate() async throws {
        try await updateNickname()
    }
    
    private func updateNickname() async throws {
        guard let username = self.username else { return }
        try await UserService.shared.updateUserNickname(withNickname: username)
    }
    
    func updateImageData() async throws {
        try await updateProfileImage()
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
}
