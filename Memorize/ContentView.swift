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
            CardView( emoji: "🎃" )
            CardView()
            CardView(emoji: "🎃")
            CardView()
        }
        .padding()
        
        
    }
    
}


struct CardView: View{
    @State var isFaceUp = false // uma visualuzacao nao pode ser alterada, é imutavel! entao adicionamos o @State para a var que na verdade é um ponteiro pra variavel, de forma que o ponteiri em si nunca muda de fato, apenas o conteudo para que ele esta apontando... a logica da carta virada ou nao ficara no back-end e nao aqui... esse tipo de ferramenta só deve ser utilizada para pequenas coisas, como o estado dessa carta e ainda sim esse estado constara no back.
    @State var showAlert = false
    var emoji = "👻"
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)

            } else {
                base.fill()
            }
        }
        .foregroundColor(.orange)
        .padding(.horizontal, 5)
        .onTapGesture {
            print("tapped")
            isFaceUp = !isFaceUp // oa tipos, assim como o Bool, sao strcuts em swift, e por serem structs possuem funcoes atribuidas, dessa forma essa alteracao de estado pode ser via toggle,assim:  isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
    
}
