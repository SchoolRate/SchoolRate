//

import SwiftUI
import MapKit

struct FranceMapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.franceRegion)
    
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(lycées) { lycée in
                Marker("\(lycée.name)", systemImage: "graduationcap.fill" ,coordinate: lycée.coordonnéesLieu)
                    .tint(.brown)
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var franceMap: CLLocationCoordinate2D {
        return .init(latitude: 46.71109, longitude: 1.7191036)
    }
}

extension MKCoordinateRegion {
    static var franceRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: .franceMap,
            span: MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 16)
        )
    }
}

#Preview {
    FranceMapView()
}
