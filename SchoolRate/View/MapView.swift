
import SwiftUI
import MapKit

struct MapView: View {
    var coordonnée: CLLocationCoordinate2D

    var body: some View {
        Map(position: .constant(.region(region)), interactionModes: [.pitch, .rotate])
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordonnée,
            span: MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.002)
        )
    }
}

#Preview {
    MapView(coordonnée: CLLocationCoordinate2D(latitude: 43.62057, longitude: 3.86971))
}
