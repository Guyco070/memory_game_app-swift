import SwiftUI

struct ScoreSectionView: View {
    var score: Int
    var tries: Int
    
    var body: some View {
        HStack {
            ScoreBox(title: "Score", value: score)
            ScoreBox(title: "Tries", value: tries)
        }
        .shadow(radius: 15)
        .padding()
    }
}

struct ScoreBox: View {
    
    var title: String
    var value: Int
    
    var body: some View {
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title)
                Text("\(value)")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .medium))
            }
            .shadow(radius: 15)
            .padding()
        }.cornerRadius(20)
    }
}
