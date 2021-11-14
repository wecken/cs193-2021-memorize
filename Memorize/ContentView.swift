//
//  ContentView.swift
//  Memorize
//
//  Created by Hiroyuki Miura on 2021/11/13.
//

import SwiftUI

struct ContentView: View {
  struct theme {
    var car = ["🚗", "🚘", "🚙", "🚐", "🚌", "🚚", "🚛", "🚑", "🚒", "🏎", "🚓"]
    var animals = ["🐼", "🦢", "🐔", "🐻", "🐶", "🐱", "🐧", "🐘", "🦒", "🦍", "🐵"]
    var nature = ["⛰", "🌞", "🌀", "🌬", "🌕", "🍀", "🌊", "🌴", "🌷", "🌍", "⚡️"]
  }
//  var emojis = ["👹", "🎵", "🎤", "📛", "💻", "🌞", "⚡️", "☂️", "🍭", "🍎", "🍺", "🚗", "🍞", "🎮", "⛰", "💡", "📱", "💮" ]
  @State var selectedTheme = theme().car
  @State var emojiCount = 5
    var body: some View {
//      let emojis = theme()
      VStack{
        Text("Memorize!").font(.largeTitle)
        ScrollView {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
            ForEach(selectedTheme[0..<emojiCount], id: \.self) { emoji in
              CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
            }
          }
          .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
          .font(.largeTitle)
          .padding()
        Spacer()
        themeSelections
      }
    }
  var themeSelections: some View {
    HStack{
      themeSelectButton(title: "Car", image: Image(systemName: "car"), action: {selectedTheme = theme().car})
      themeSelectButton(title: "Animals", image: Image(systemName: "pawprint.fill"), action: {selectedTheme = theme().animals})
      themeSelectButton(title: "Nature", image: Image(systemName: "leaf"), action: {selectedTheme = theme().nature})
    }
    .frame(maxWidth: .infinity)
  }
  
  struct themeSelectButton: View {
    var title: String
    let image: Image
    var action = {}
    var body: some View{
      VStack {
        Button(
          action: action,
          label: {
            image
          }
        )
        Text(title)
      }
        .frame(minWidth: 0,  maxWidth: .infinity)
        .foregroundColor(.blue)
    }

  }
  var remove: some View {
    Button(action: {
      if emojiCount > 1 {
        emojiCount -= 1
      }
    }, label: {
      Image(systemName: "minus.circle")
    })
  }
  var add: some View {
    return Button(
      action: {
      if emojiCount < selectedTheme.count {
        emojiCount += 1
      }
    },
      label: {
      Image(systemName: "plus.circle")
    })
  }
}

struct CardView: View {
  @State var isFaceUp: Bool = true
  var content: String
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if isFaceUp {
        shape.fill(.white)
        shape.strokeBorder(lineWidth: 2)
        Text(content)
          .font(.largeTitle)
      } else {
        Text(" ")
          .font(.largeTitle)
        shape.fill()
      }
    }
    .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    .onTapGesture {
      isFaceUp = !isFaceUp
    }
  }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
          .preferredColorScheme(.light)
        .previewInterfaceOrientation(.portrait)
        ContentView()
          .preferredColorScheme(.light)
          .previewInterfaceOrientation(.portrait)
      }
      ContentView()
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
