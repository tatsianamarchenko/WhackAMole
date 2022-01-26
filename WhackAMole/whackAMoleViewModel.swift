//
//  whackAMoleViewModel.swift
//  WhackAMole
//
//  Created by Tatsiana Marchanka on 24.01.22.
//

import Foundation
class WhackAMoleViewModel : ObservableObject {

  @Published private var model: WhackAMoleModel = WhackAMoleViewModel.createMemoryGame()

   static func createMemoryGame() -> WhackAMoleModel {
     return WhackAMoleModel()
   }

  func updateArray() {
    Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.update), userInfo: nil, repeats: false)
  }
  @objc func update() {
    model.updateArray()
  }
  func changeScore ( element: WhackAMoleModel.SingleHole) {
    model.scoreCount(element: element)
    updateArray()
  }
  func timerManager () {
    model.timerManager()
  }
  func startGame () {
    model.startGame()
  }
  func createNewGame () {
    model.createNewGame()
  }
  var gameArray: Array<WhackAMoleModel.SingleHole> {
    model.gameArray
  }
  var score: Int {
    model.score
  }
  var timer: Int {
    model.timer
  }
  var start: Bool {
    model.start
  }
}
