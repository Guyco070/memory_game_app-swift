import SwiftUI

class Card: ObservableObject{
    var url: String?;
    @Published var isFlipped = false;
    
    init(url: String? = nil, isFlipped: Bool = false) {
        self.url = url
        self.isFlipped = isFlipped
    }
}
