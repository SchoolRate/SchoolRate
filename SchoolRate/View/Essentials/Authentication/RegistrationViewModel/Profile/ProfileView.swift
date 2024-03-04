//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @StateObject var viewModel = ProfileModel()
    
    @State private var showEditProfile = false
    @State private var selectedFilter: ProfileAnswerReviewFilter = .reviews
    
    @Namespace var animationEffect
    
    var user: User?
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(currentUser?.username ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        if let bio = currentUser?.bio {
                            Text(bio)
                                .font(.footnote)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                        
                        Text("3 avis")
                            .font(.footnote)
                            .foregroundStyle(Color(.systemGray))
                        
                    }
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                    
                    CircularProfileImage()
                    
                } .padding(.horizontal)
                
                Button {
                    showEditProfile = true
                } label: {
                    HStack {
                        Text("Réglages")
                        Image(systemName: "gear")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorScheme == .dark ? .black : .white)
                    .frame(width: 352, height: 32)
                    .background(colorScheme == .dark ? .white : .black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding(.top, 30)
                }
                .sheet(isPresented: $showEditProfile) {
                    EditProfileView()
                }
                
                VStack {
                    HStack {
                        ForEach(ProfileAnswerReviewFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular )
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundStyle(.black)
                                        .frame(width: 180, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animationEffect)
                                } else {
                                    Rectangle()
                                        .foregroundStyle(.secondary)
                                        .frame(width: 180, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    } 
                    .padding(.top, 20)
                    
                    LazyVStack {
                        ForEach(0...10, id: \.self) { /*review*/ _ in
                            ReviewsCell()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
  ProfileView()
}
