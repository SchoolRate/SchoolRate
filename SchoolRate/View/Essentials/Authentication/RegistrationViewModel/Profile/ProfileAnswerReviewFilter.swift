//

import Foundation

enum ProfileAnswerReviewFilter: Int, CaseIterable, Identifiable {
    case reviews
    case replies
    
    var title: String {
        switch self {
        case .reviews: return "Avis"
        case .replies: return "Réponses"
        }
        
    }
    
    var id: Int { return self.rawValue }
}
