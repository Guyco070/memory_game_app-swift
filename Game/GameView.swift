import SwiftUI

struct GameView: View {
    
    @ObservedObject var game: Game;
    
    var body: some View {
        let _ = Self._printChanges()
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            ScrollView {
                    VStack {
                        HStack {
                            Button(action: game.toggleIsPlaying) {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 23))
                            }
                            Text("\(game.category) Memory Game")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Button(action: game.resetGame) {
                                Image(systemName: "memories")
                                    .font(.system(size: 23))
                            }
                        }
                        ScoreSectionView(score: game.score[0], tries: game.tries[0])
                        CardsView(game: game)
                    }
            }
            .shadow(radius: 15)
            .padding()
        }
    }
}
