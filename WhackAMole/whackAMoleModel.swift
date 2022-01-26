//
//  whackAMoleModel.swift
//  WhackAMole
//
//  Created by Tatsiana Marchanka on 24.01.22.
//

import Foundation
struct WhackAMoleModel {

  var gameArray: Array<SingleHole>
  var score = 0
  var start = false
  var timer = 60

  mutating func createNewGame () {
     score = 0
     start = false
     timer = 60
  }

  mutating func startGame () {
    start = true
  }

  mutating func timerManager () {
    if start {
    timer -= 1
      if self.timer == 0 {
        start = false
        timer = 60
        score = 0
      }
    }
  }

  mutating func updateArray () {
    gameArray = Array<SingleHole>()
    for index in 0..<9 {
      let randon = Int.random(in: 0..<9)
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

  mutating func scoreCount (element:  SingleHole) {
    gameArray[element.id].show = false
    gameArray[element.id].isTapped = true
    if gameArray[element.id].isTapped {
      score += 1
    }
  }

  init() {
    gameArray = Array<SingleHole>()
    for index in 0..<9 {
      let randon = Int.random(in: 0..<9)
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
