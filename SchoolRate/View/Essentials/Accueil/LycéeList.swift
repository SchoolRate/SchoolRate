import SwiftUI

struct LycéeList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer().padding(.top, 4)
                    
                    TextField("Rechercher un établissement", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .frame(width: geometry.size.width * 0.9)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                    
                    Spacer().padding(.top, 10)
                    
                    LazyVStack(spacing: getSpacing(for: geometry.size.width)) {
                        ForEach(lycées) { lycée in
                            NavigationLink(destination: LycéeDétail(lycée: lycée)) {
                                LycéeRow(lycée: lycée)
                            }
                        }
                    }
                }
                .navigationTitle("Lycées")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
    
    func getSpacing(for width: CGFloat) -> CGFloat {
        if width > 429 {
            return 205
        } else {
            return 207
        }
    }
}

#Preview {
    LycéeList()
}
