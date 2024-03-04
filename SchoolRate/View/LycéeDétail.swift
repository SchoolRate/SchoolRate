//

import SwiftUI
import CoreML

struct LycéeDétail: View {
    @State var isShowingSheet = false
    @State var rating = 1
    
    var lycée: Lycée
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                MapView(coordonnée: lycée.coordonnéesLieu)
                    .frame(width: geometry.size.width, 
                           height: geometry.size.height * 0.42)
                
                CircleImage(lycée: lycée)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text(lycée.name)
                        .font(.title)
                    
                    HStack {
                        Text("\(lycée.category)")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("À propos de \(lycée.name)")
                        .font(.title2)
                    
                    Text(lycée.description)
                    
                    Divider()
                    
                    HStack {
                        Text("Commentaires")
                            .font(.title)
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 25))
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            RatingView(generalRating: .constant(1), 
                                       teachersRating: .constant(1),
                                       staff: .constant(1))
                        }
                    }
                    .padding(.top, 30)
                }
                .padding(.horizontal)
            }
            .navigationTitle(lycée.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    LycéeDétail(lycée: lycées[0])
}
