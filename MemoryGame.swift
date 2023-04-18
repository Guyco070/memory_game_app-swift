import SwiftUI

struct MemoryGame: View {
    
    @ObservedObject private var game = Game();

    var body: some View {
        VStack {
            if(!game.isPlaying){
                MenuView(game: game)
            } else {
                GameView(game: game)
            }
        }
    }
}
