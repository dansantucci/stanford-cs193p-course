//
//  ContentView.swift
//  Memorize
//
//  Created by Danilo S Nascimento on 08/07/20.
//  Copyright © 2020 DanSantucci. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding()
        }
        .padding()
        .foregroundColor(Color.orange)
        //      Assignment 1 - Set smaller font when the game has 5 or more pairs
//        .font(viewModel.cards.count > 4 ? Font.headline : Font.largeTitle)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            self.body(for: geometry.size)
        })
    }
    
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5).opacity(0.4)
                Text(card.content)
            }
            //      Assignment 1 - Force 2:3 aspect ratio
            .frame(width: 108, height: 72, alignment: .center)
            //      Assignment 1 - Set smaller font when the game has 5 or more pairs
            .font(Font.system(size: fontSize(for: size)))
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    
//    MARK: - Drawing Constants
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
         EmojiMemoryGameView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
   }
}
