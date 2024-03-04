//
//  MapView.swift
//  SchoolRate Core
//
//  Copyright (c) 2024 SchoolRate. All rights reserved
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

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
