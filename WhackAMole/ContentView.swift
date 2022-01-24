//
//  ContentView.swift
//  WhackAMole
//
//  Created by Tatsiana Marchanka on 24.01.22.
//

import SwiftUI

struct ContentView: View {
  @State var show = false
  var body: some View {
    ZStack {
      Rectangle()
        .fill(LinearGradient(gradient: Gradient(colors: [.mint,.blue]), startPoint: .topLeading, endPoint: .center)).opacity(0.3)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea()
      VStack {
        ZStack {
          Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [.mint,.blue]), startPoint: .topLeading, endPoint: .center)).opacity(0.2)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))

          LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], content: {
            ForEach(0 ..< 9) { item in
              GameElement(show: $show)

                .onTapGesture {
                  show.toggle()
                }
            }
          })
        }.padding(.horizontal)
        
        Spacer(minLength: 50)

        ZStack{
          Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [.mint,.blue]), startPoint: .topLeading, endPoint: .center)).opacity(0.2)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
          //        .ignoresSafeArea()
          VStack {
            Text("Score: 1")
              .font(.title)
              .fontWeight(.semibold)
              .foregroundColor(.white)
              .padding()
            HStack {
              Button {
                //
              } label: {
                Image(systemName: "restart.circle.fill")
                  .resizable()
                  .foregroundColor(.pink)
                  .frame(width: 80, height: 80, alignment: .leading)
                  .clipShape(Circle())
              }

              Button {
                //
              } label: {
                Image(systemName: "pause.circle.fill")
                  .resizable()
                  .foregroundColor(.pink)
                  .frame(width: 80, height: 80, alignment: .leading)
                  .clipShape(Circle())
              }
            }.padding(10)
          }
        }
        .frame(width: 300, height: 100, alignment: .center)
      }
    }
  }
}

let screen = UIScreen.main.bounds

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct GameElement: View {
  var width = CGFloat(80)
  var height = CGFloat(80)
  @Binding var show : Bool
  var body: some View {
    let multiplier = width / 44
    let progress : Double = Double((100 - 90)) * 0.01
    ZStack {
      Circle().fill(.blue.opacity(0.3))
      Circle()
        .stroke(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.1), .black.opacity(0.3)]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3.5 * multiplier, lineJoin: .round))

      Circle()
        .trim(from: show ? progress : 1, to: 1)
        .stroke(LinearGradient(gradient: Gradient(colors: [.indigo, .pink]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3.5 * multiplier, lineJoin: .round))
        .rotationEffect(Angle(degrees: 90))
        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
        .shadow(color: Color.purple.opacity(0.9), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
      Image("nlo")
        .resizable()
        .frame(width: 90, height: 90)
        .aspectRatio(contentMode: .fill)
        .shadow(color: .green, radius: 3, x: 3, y: 3)
        .padding(8)
        .offset(y: show ? -30 : 0).animation(.easeInOut, value: show)
    }.padding(.vertical, 3)
      .rotation3DEffect(Angle(degrees: -300), axis: (x: 10, y: 0, z: 0),  perspective: 0.8)
      .frame(width: 100, height: 100)
  }
}
