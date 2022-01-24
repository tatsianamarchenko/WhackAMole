//
//  whackAMoleModel.swift
//  WhackAMole
//
//  Created by Tatsiana Marchanka on 24.01.22.
//

import Foundation
struct WhackAMoleModel {
  var gameArray: Array<SingleHole>
  private var indexOfShowedUpCard : Int? {
    get { gameArray.indices.filter { gameArray[$0].show }.one
  }
    set { gameArray.indices.forEach {gameArray[$0].show = ($0 == newValue)}
    }
  }
  var accesstime = 3
  var score = 0

  mutating func scoreCount (hole: SingleHole) {
   if let chosenIndex = gameArray.firstIndex(where: { $0.id == hole.id })//, gameArray[chosenIndex].isTapped {
    {
     if let indexOfMayBeMatch = indexOfShowedUpCard {
       if gameArray[chosenIndex].show {
         gameArray[chosenIndex].isTapped = true
         if hole.isTapped == true {
           score += 1
         } else {
           if score > 0 {
             score -= 1
           }
           else {
             score = 0
           }
         }
       }
     }
    }
  }


  init() {
    gameArray = Array<SingleHole>()
    for index in 0..<9 {
      var randon = Int.random(in: 0..<9)
      var randomShow : Bool
      if randon % 2 == 0
      {
        randomShow = true
      }
      else {
        randomShow = false
      }
      gameArray.append(SingleHole(id: index, show: randomShow, isTapped: false))
    }
  }

  struct SingleHole: Identifiable {
    var id: Int
    var show : Bool
    var isTapped : Bool
  }
}

extension Array {
  var one : Element?   {
    if self.count == 1 {
      return self.first
    } else {
      return nil
    }
  }
}
