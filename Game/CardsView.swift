import SwiftUI

struct CardsView: View {
    @ObservedObject var game: Game
    
    var body: some View {
//        let _ = Self._printChanges()
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 8) {
            ForEach(Array(game.cards.enumerated()), id: \.offset) { index, card in CardView(card: card, flipCard: game.flipCard)
            }
        }
        .shadow(radius: 15)
        .padding()
    }
}
