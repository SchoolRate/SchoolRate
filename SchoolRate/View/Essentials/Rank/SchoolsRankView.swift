//

import SwiftUI

struct SchoolsRankView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Classement")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                    
                    LiveAnimation()
                        .padding()
                }
                
                LazyVStack(alignment: .leading) {
                    ForEach(0...10, id: \.self) { user in
                        HStack {
                            Image(systemName: "number")
                            
                            Text("1")
                            
                            /*Image("montpellierNevers")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())*/
                            
                            VStack {
                                Text("Lycée Privé Nevers")
                                    .font(.footnote)
                                    .padding(.leading)
                                Text("200 votes")
                                    .padding(.trailing)
                                    .font(.headline)
                            }
                            .padding(.leading)
                            .padding(.horizontal, -25)
                            
                            Spacer()
                            
                            HStack {
                                Button {
                                } label: {
                                    Image(systemName: "arrow.up.square.fill")
                                        .foregroundStyle(.green)
                                }
                                
                                Button {
                                } label: {
                                    Image(systemName: "arrow.down.square.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                } .padding()
            }
        }
    }
}

#Preview {
    SchoolsRankView()
}
