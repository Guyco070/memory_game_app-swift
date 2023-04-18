import SwiftUI

struct MenuView: View {
    @ObservedObject var game: Game;

    var body: some View {
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    MenuSection(title: "Category", valArr: ["Random"], currentVal: game.category, setValue: game.setCategory)
                    MenuSection(title: "Cards Amount", valArr: ["6", "8", "10", "12", "20", "24"], currentVal: String(game.cardsAmount), setValue: game.setCardsAmount)
                    MenuSection(title: "Card Flip Speed", valArr: ["Easy", "Medium", "Hard"], currentVal: "\(game.flipSpeed)", setValue: game.setFlipSpeed)
                    MenuSection(title: "Players Amount", valArr: ["1", "2", "3", "4"], currentVal: String(game.playerAmount), setValue: game.setPlayersAmount)
                    
                    ZStack {
                        Color(.purple)
                            .ignoresSafeArea()
                        VStack {
                            Button("Play"){
                                game.playGame()
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                            .padding(.horizontal, 8)
                            .fontWeight(.bold)
                        }.padding()
                    }.cornerRadius(20)
                        .padding(.top, 60)
                        .padding(.horizontal, 100)
                    
                }
            }
            .shadow(radius: 15)
            .padding()
        }
    }
}

struct MenuSection: View {
    var title: String
    var valArr: Array<String>
    var currentVal: String
    var setValue: (String) -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Choose " + title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                ZStack {
                    Color(.purple)
                        .ignoresSafeArea()
                    HStack {
                        ForEach(valArr, id: \.self) { value in
                            Button(value){
                                setValue(value)
                            }
                            .foregroundColor(.white)
                            .font(value == currentVal ? .system(size: 26) : .title2)
                            .padding(.horizontal, 8)
                            .fontWeight(value == currentVal ? .bold : .medium)
                            
                        }.padding(.bottom, 1)
                    }.padding()
                }.cornerRadius(20)
            }
            .shadow(radius: 15)
            .padding()
        }
    }
}
