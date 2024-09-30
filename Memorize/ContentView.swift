//
//  ContentView.swift
//  Memorize
//
//  Created by Carlos Eduardo Roriz on 30/09/24.
//

import SwiftUI

struct ContentView: View { //behaves like a... a "tipacao" da struct significa que ela vai se comportar como(o tipo da struct, no caso View)
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true, emoji: "🎃" )
            CardView()
            CardView()
            CardView()
        }
        .padding()
        
        
    }
    
}


struct CardView: View{
    var isFaceUp: Bool = false
    var emoji = "👻"
    var body: some View {
        ZStack(content: {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)

            } else {
                RoundedRectangle(cornerRadius: 12)
                
            }
        })
        .foregroundColor(.orange)
        .padding(.horizontal, 5)
    }
}



#Preview {
    ContentView()
    
}
