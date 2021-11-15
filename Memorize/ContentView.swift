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
    var animals = ["🐼", "🦢", "🐔", "🐻", "🐶", "🐱", "🐧", "🐘", "🦒", "🦍" ]
    var nature = ["⛰", "🌞", "🌀", "🌬", "🌕", "🍀", "🌊", "🌴", "🌷"]
  }
//  var emojis = ["👹", "🎵", "🎤", "📛", "💻", "🌞", "⚡️", "☂️", "🍭", "🍎", "🍺", "🚗", "🍞", "🎮", "⛰", "💡", "📱", "💮" ]
  @State var selectedTheme = theme().car

    var body: some View {
//      let emojis = theme()
      VStack{
        Text("Memorize!").font(.largeTitle)
        ScrollView {
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
            ForEach(selectedTheme[0..<selectedTheme.count], id: \.self) { emoji in
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
      themeSelectButton(title: "Car", image: Image(systemName: "car"), action: {selectedTheme = theme().car.shuffled()})
      themeSelectButton(title: "Animals", image: Image(systemName: "pawprint.fill"), action: {selectedTheme = theme().animals.shuffled()})
      themeSelectButton(title: "Nature", image: Image(systemName: "leaf"), action: {selectedTheme = theme().nature.shuffled()})
    }
    .frame(maxWidth: .infinity)
  }

  struct themeSelectButton: View {
    var title: String
    let image: Image
    var action = {}
    var body: some View{
        Button(
          action: action,
          label: {
            VStack {
              image
              Text(title)
            }
          }
        )
        .frame(minWidth: 0,  maxWidth: .infinity)
        .foregroundColor(.blue)
    }

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
          .previewInterfaceOrientation(.landscapeLeft)
      }
      ContentView()
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
