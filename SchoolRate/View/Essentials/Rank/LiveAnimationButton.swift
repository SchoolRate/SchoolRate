//

import SwiftUI

struct LiveAnimation: View {
    @State private var isLive = false
    
    var body: some View {
        TimelineView(.animation) { /*context*/ _ in
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 80, height: 30)
                    .cornerRadius(10)
                    .opacity(isLive ? 1.0 : 0.5)
                
                Text("LIVE")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .opacity(isLive ? 1.0 : 0.5)
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                    self.isLive.toggle()
                }
            }
        }
    }
}

#Preview {
    LiveAnimation()
}
