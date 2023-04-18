import SwiftUI

struct CardView: View {
    @ObservedObject<Card> var card: Card;
    var flipCard: (Card) -> Void
    
//    init(card: Card, flipCard: (Card) -> Void){
//        self.card = card;
//        self.flipCard = flipCard;
//    }
    
    var body: some View {
        VStack {
            if(card.isFlipped){
                Image(card.url!).resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
            }
            else {
                Button(action: {
                    flipCard(card)
                }) {
                    ZStack {
                        VStack {
                            Rectangle()
                                .frame(minHeight: 120)
                                .foregroundColor(.purple)
                                .cornerRadius(20)
                        }
                        Text("?")
                            .font(.system(size: 80, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
