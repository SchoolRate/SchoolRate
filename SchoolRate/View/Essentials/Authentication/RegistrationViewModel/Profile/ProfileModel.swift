/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An observable state object that contains profile details.
*/

import SwiftUI
import PhotosUI
import CoreTransferable
import Combine

class ProfileModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
        
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellable)
    }
}
