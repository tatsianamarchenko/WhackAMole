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



  func changeScore (_ element: WhackAMoleModel.SingleHole) {
    model.scoreCount(hole: element)
  }

  var gameArray: Array<WhackAMoleModel.SingleHole> {
    model.gameArray
  }

}
