//
//  ContentView.swift
//  Memorize
//
//  Created by Hiroyuki Miura on 2021/11/13.
//

import SwiftUI

struct ContentView: View {

  @State var characters = [
    "アンパンマン",
    "バイキンマン",
    "ドキンちゃん",
    "食パンマン",
    "だだんだん",
    "もぐりん",
    "ジャムおじさん",
    "コキンちゃん",
    "ホラーマン",
    "カビるんるん",
    "バイキンユーホー",
    "ドキンユーホー",
    "コキンユーホー",
    "ごろんごろ",
  ]

  @State var cardCount = 4
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
  ]

    var body: some View {

      VStack{
        Text("アンパンマンカード!").font(.largeTitle)
        ScrollView {
          LazyVGrid(columns: columns, spacing: 8){
            ForEach(characters.shuffled(), id: \.self) { character in
              CardView(content:
                        Image(character), name: character)
                          .aspectRatio(2/3, contentMode: .fill)
                          .padding()

          }
        }
          .font(.largeTitle)

      }
        ShuffleButton(action:{
          characters.shuffle()
        })
    }
  }
  
  struct ShuffleButton: View {
    var action = {}
    var body: some View {
      Button(action: action, label: {
        Text("まぜる")
      })
    }
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
      if cardCount > 1 {
        cardCount -= 1
      }
    }, label: {
      Image(systemName: "minus.circle")
    })
  }
  var add: some View {
    return Button(
      action: {
      if cardCount < characters.count {
        cardCount += 1
      }
    },
      label: {
      Image(systemName: "plus.circle")
    })
  }
}

struct CardView: View {
  @State var isFaceUp: Bool = true
  var content: Image
  var name: String
  let cornerRadius: CGFloat = 8
  var body: some View {
    ZStack {

      let shape = RoundedRectangle(cornerRadius: cornerRadius)
      if isFaceUp {
        ZStack {
          shape
          VStack {
            ZStack(alignment: .center) {
              content
                .resizable()
                .scaledToFit()
              //TODO: Card size differs when flipped.
              //TODO: Image should have 1/1 aspect, and should be cropped by aspectFill mode. 
            }
            Spacer()
            Text(name)
              .minimumScaleFactor(0.01)
              .foregroundColor(.black)
              .font(.body)
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.9))
          }
          .clipped()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      } else {
        ZStack {
          shape.foregroundColor(.white)
          Image("cover").resizable().scaledToFill()
        }
      }
    }
    .cornerRadius(cornerRadius)
    .clipped()
    .shadow(radius: 8)
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
