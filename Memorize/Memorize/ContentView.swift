//
//  ContentView.swift
//  Memorize
//
//  Created by Danilo S Nascimento on 08/07/20.
//  Copyright © 2020 DanSantucci. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel = EmojiMemoryGame()
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
//      Assignment 1 - Set smaller font when the game has 5 or more pairs
        .font(viewModel.cards.count > 4 ? Font.headline : Font.largeTitle)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
//      Assignment 1 - Force 2:3 aspect ratio
        .frame(width: 108, height: 72, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
         ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
   }
}
