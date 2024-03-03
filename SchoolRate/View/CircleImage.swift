import SwiftUI
import MapKit

struct CircleImage: View {
    var lycée: Lycée
    @State private var flyoverImage: UIImage?
    
    func getFlyoverSnapshot() async throws {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: lycée.coordonnéesLieu, span: MKCoordinateSpan())
        options.mapType = .hybridFlyover
        
        let camera = MKMapCamera()
        camera.centerCoordinate = lycée.coordonnéesLieu
        camera.pitch = 55.0
        camera.centerCoordinateDistance = 400
        options.camera = camera
        
        let snapshotter = MKMapSnapshotter(options: options)
        let snapshot = try await snapshotter.start()
        flyoverImage = snapshot.image
    }
    
    var body: some View {
        ZStack {
            if let image = flyoverImage {
                Image(uiImage: image)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
            }
        }
        .onAppear {
            Task {
                do {
                    try await getFlyoverSnapshot()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    CircleImage(lycée: lycées[0])
}
