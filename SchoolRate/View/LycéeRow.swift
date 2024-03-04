import MapKit
import SwiftUI

enum Errors: Error {
    case doesntExist
}

struct LycéeRow: View {
    var lycée: Lycée
    
    @State private var snapshotImage: UIImage?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .topLeading) {
                    if let image = snapshotImage {
                        Image(uiImage: image)
                            .resizable()
                            .blur(radius: 30)
                            .frame(width: geometry.size.width - 40, 
                                   height: (geometry.size.width - 40) * 210 / 360)
                            .clipShape(
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 30))
                            )
                            .scaledToFit()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(lycée.name)
                                    .font(
                                        .system(size: 16,
                                                weight: .medium,
                                                design: .rounded)
                                        .bold()
                                    )
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 16)
                                    .padding(.top, 17)
                                    .padding(.bottom, -1)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "ellipsis.circle")
                                }
                                .foregroundStyle(Color(.systemGray6))
                                .offset(y: 10)
                                .padding(.horizontal)
                            }
                            
                            Text(lycée.adresse)
                                .font(
                                    Font.custom("Bodoni 72", size: 24)
                                    .bold()
                                )
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                                .offset(y: 5)
                            
                            if let image = snapshotImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: geometry.size.width - 54, 
                                           height: (geometry.size.width - 66) * 138 / 350)
                                    .clipShape(
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 30))
                                    )
                                    .padding(.horizontal, 7)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            .onAppear {
                Task {
                    do {
                        try await getSnapshot()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func getSnapshot() async throws {
        let options = MKLookAroundSnapshotter.Options()
        options.size = CGSize(width: 300, height: 120)
        
        guard let scene = try await MKLookAroundSceneRequest(coordinate: lycée.coordonnéesLieu).scene else {
            throw Errors.doesntExist
        }
        
        let image = try await MKLookAroundSnapshotter(scene: scene, options: options).snapshot.image
        snapshotImage = image
    }
}

#Preview {
    Group {
        LycéeRow(lycée: lycées[1])
    }
}
