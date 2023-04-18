import SwiftUI

enum FlipSpeeds {
    case Easy, Medium, Hard
}

class Game: ObservableObject {
    @Published var isPlaying = false;
    
    @Published var cards: [Card] = [];
    private var flipped: Array<Card> = [];
    private var currentFliped: Array<Card> = [];
    var winners: Array<Int> = [];
    
    @Published var category = "Random";
    @Published var currentPlayer = 0;
    @Published var cardsAmount = 6;
    @Published var playerAmount: Int = 1;
    @Published var score = [0];
    @Published var tries: Array<Int> = [0];
    @Published var flipSpeed = FlipSpeeds.Medium
    
    func initializeGame(){
        let data: [Int] = Array(1...50);
        var dataToView: [Int];
        
        dataToView = Array(data.shuffled()[0...(cardsAmount/2)-1]);
        dataToView.append(contentsOf: dataToView);
        dataToView = dataToView.shuffled();
        cards = [];
        
        for number in dataToView {
            cards.append(Card(url:"\(category)/image-\(number)"))
        }
    }
    
    func playGame(){
        initializeGame()
        isPlaying.toggle()
    }
    
    func clearGame(){
        currentPlayer = 0
        tries = Array(0..<playerAmount)
        score = Array(0..<playerAmount)
        currentFliped = []
        flipped = []
        winners = []
    }
    
    func resetGame(){
        clearGame();
        initializeGame();
    }
    
    func toggleIsPlaying(){ isPlaying.toggle() }
    
    func setIntFromString(val: String, fun: (Int) -> Void) { fun(Int(val)!) }
    
    func setCategory(newCategory: String){
        category = newCategory
    }
    
    func setCardsAmount(newCardsAmount: String){
        cardsAmount = Int(newCardsAmount)!
    }
    
    func setFlipSpeed(newFlipSpeed: String){
        switch newFlipSpeed{
        case "Easy": flipSpeed = FlipSpeeds.Easy
            break;
        case "Medium": flipSpeed = FlipSpeeds.Medium
            break;
        case "Hard": flipSpeed = FlipSpeeds.Hard
            break;
        default:
            break;
        }
    }
    
    func setPlayersAmount(newPlayersAmount: String){
        playerAmount = Int(newPlayersAmount)!
    }
    
    func flipBack() async {
        try! await Task.sleep(until: .now + .seconds(1), clock: .continuous)
        if(currentFliped.isEmpty){
            return
        } else {
            currentFliped[0].isFlipped.toggle()
            if(currentFliped.count == 2){
                currentFliped[1].isFlipped.toggle()
            }
        }
    }
    
    func flipCard(card: Card) {
        if(!card.isFlipped){
            if(currentFliped.count < 2){
                currentFliped.append(card)
                card.isFlipped.toggle()
            }
            
            if(currentFliped.count == 2) {
                tries[currentPlayer] += 1;
                if(currentFliped[0].url == currentFliped[1].url) {
                    score[currentPlayer] += 50;
                    
                    flipped += currentFliped
                    currentFliped = []
                    
                } else {
                    Task{
                        await flipBack()
                        currentFliped = []
                    }
                }
            }
        }
    }
}
