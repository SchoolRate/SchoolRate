//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                SchoolRateTabView()
            } else {
                LoginView()
            }
        }
    }
}
    
#Preview {
    ContentView()
}
