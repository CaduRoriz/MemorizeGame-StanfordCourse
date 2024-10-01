//  ContentView.swift
//  Memorize
//  Created by Carlos Eduardo Roriz on 30/09/24.
import SwiftUI

    struct ContentView: View {
        let emojis: [String] = ["👻", "🎃", "🕷️", "👹", "🕸️", "💀", "🧛🏻", "🧌", "😱", "🦇", "🍭", "☠️"]
        @State var cardCount: Int = 4
        
        var body: some View {
            VStack{
                ScrollView{
                    cards
                }
                
                Spacer()
                cardAdjustersStack
            }.padding( 20)
            
            }
        
        var cards: some View {
            return LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(emoji: emojis[index])
                }
            }
        }
        
        var cardAdjustersStack: some View {
            HStack{
                cardCountBuilder(acao: {if cardCount > 1 { cardCount -= 1 }}, simbol: "rectangle.stack.fill.badge.minus")
                Spacer()
                cardCountBuilder(acao: {if cardCount < emojis.count { cardCount += 1 }}, simbol: "rectangle.stack.fill.badge.plus")
            }
        }
        
        func cardCountBuilder(acao: @escaping () -> Void, simbol: String) -> some View {
            return Button(action: {
                acao()
            }, label: {
                Image(systemName: simbol).font(.largeTitle)
            })
        }

    }

    struct CardView: View {
        @State var isFaceUp = true
        let emoji: String
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)
                
                base.fill(.opacity(isFaceUp ? 0 : 1))
                
            }
            .foregroundColor(.orange)
            .onTapGesture {
                isFaceUp.toggle()
            }
            .aspectRatio(2/3, contentMode: .fit)
        
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

