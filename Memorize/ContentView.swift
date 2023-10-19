//
//  ContentView.swift
//  Memorize
//
//  Created by Tobias Nix on 05.10.23.
//

import SwiftUI

// var emojis: Array<String> = ["🍎","🥑","🥦","🥒","🍇","🍕","🥐","🌶️"]
// var emojis = ["🍎","🥑","🥦","🥒","🍇","🍕","🥐","🌶️"]

struct ContentView: View {
    
    static var emojis = ["🍎","🥑","🥦","🥒","🍇","🍕","🥐","🌶️"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards()
            Spacer()
            /*HStack {
             ForEach(0..<cardCount, id: \.self, content: {
             i in
             CardView(isFaceUp: true, symbol: emojis[i])
             })}*/
            HStack {
                /*
                 Button(action: {
                 if cardCount < emojis.count {
                 cardCount+=1
                 }
                 }
                 , label: {
                 Text("more")
                 })
                 Spacer()
                 Button(action: {if cardCount > 1 {
                 cardCount-=1
                 }
                 }, label: {
                 Text("less")
                 }) */
                // cardAdjuster(by: 1, symbolName: "plus.square")
                minusButton()
                Spacer()
                plusButton()
                //cardAdjuster(by: -1, symbolName: "minus.square")
            }
        }
        .foregroundColor(.green)
        .font(.largeTitle)
        .padding()
    }
    
    func plusButton() -> some View {
        cardAdjuster(by: 1, symbolName: "plus.square")
    }
    
    func minusButton() -> some View {
        cardAdjuster(by: -1, symbolName: "minus.square")
    }
    
    func cards() -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 135), spacing: 0)], spacing: 0) {
                // HStack {
                ForEach(0..<cardCount, id: \.self, content: { i in
                    CardView(content: ContentView.emojis[i])
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                })
            }
        }
    }
    func cardAdjuster(by offset: Int, symbolName: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbolName)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > ContentView.emojis.count)
    }
}

struct CardView: View {
    //var isFaceUp: Bool = false
    @State var isFaceUp = true
    var content : String
    var body : some View {
        let cardShape = RoundedRectangle(cornerRadius: 10)
        ZStack{
            if isFaceUp {
                    cardShape.fill(.white)
                    cardShape.strokeBorder(lineWidth: 5.0)
                    // Text(content).font(.largeTitle)
                
            } else {
                cardShape.fill()
            }
            Text(content).font(.largeTitle).opacity(isFaceUp ? 1.0 : 0.0)
        }
        .onTapGesture(perform: {
            isFaceUp.toggle()
        })
    }
}

#Preview {
    ContentView()
}

/*
 
 struct ContentView03: View {
 var body: some View {
 HStack {
 CardView(isFaceUp: true, symbol: "🚘")
 CardView(isFaceUp: true, symbol: "⚓️")
 CardView(isFaceUp: false, symbol: "🚦")
 CardView(isFaceUp: false, symbol: "🎠")
 CardView(isFaceUp: true, symbol: "🛵")
 }
 .foregroundColor(.green)
 .padding()
 }
 }
 
 struct ContentView02: View {
 var body: some View {
 HStack {
 ZStack {
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .fill(.white)
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .strokeBorder(lineWidth: 5.0)
 Text("🚁")
 .font(.largeTitle)
 }
 ZStack {
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .fill(.white)
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .strokeBorder(lineWidth: 5.0)
 Text("🚔")
 .font(.largeTitle)
 }
 ZStack {
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .fill(.white)
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .strokeBorder(lineWidth: 5.0)
 Text("✈️")
 .font(.largeTitle)
 }
 ZStack {
 // Rectangle()
 // Circle()
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .fill(.white)
 RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
 .strokeBorder(lineWidth: 5.0)
 .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
 Text("🏔️")
 }
 }
 .font(.largeTitle)
 .foregroundColor(.blue)
 }
 }
 
 struct ContentView01: View {
 // stored property
 var i : Int = 9
 var s : String = "abc"
 
 // computed property
 var body: some View {
 VStack {
 Image(systemName: "globe")
 .imageScale(.large)
 .foregroundStyle(.tint)
 Text("Hello, world!")
 }
 .padding()
 }
 }
 
 #Preview {
 ContentView()
 }
 
*/
