//

import SwiftUI

struct ReviewsCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Lycée privé nevers")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10 mois")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                    }
                    
                    Text("Ce lycée est exceptionnel")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.left")
                        }
                    }
                    .foregroundStyle(Color(.systemGray))
                    
                    Divider()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ReviewsCell()
}
