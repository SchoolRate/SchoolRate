//

import SwiftUI

struct SchoolRateTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LycéeList()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            SchoolsRankView()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Editorial()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "newspaper.fill" : "newspaper")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "person.crop.circle.fill" : "person.crop.circle")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
        }
        .tint(.black)
    }
}

#Preview {
    SchoolRateTabView()
}
