//
//  Game.swift
//  Game15
//
//  Created by Serena Dose on 26/08/2017.
//  Copyright © 2017 Serena Dsoe. All rights reserved.
//

import Foundation

class Game {
    
    var board: [Int] = []
    
    private let dim = 16

    private var difficulty: GameDifficulty
    
    init(difficulty: GameDifficulty){
        
        for i in 1...dim {
            
            board.append(i)
            
        }
        
        self.difficulty = difficulty
  
    }
    
    func printBoard(){
        
        for i in 0...dim - 1 {
            
            let s = " "
            let number = String(board[i])
            
            if board[i] < 10{
                print(s + number + s, terminator:"")
            }else{
                print(number + s, terminator:"")
            }
            if (i + 1) % 4 == 0 {
                print()
            }
            
        }
    }
    
    func sorted() -> Bool{
        
        for i in 0...dim - 1 {
            
            if board[i] != i+1{
                
                return false    }
        }
        
        return true
        
    }
    
    func canMove( number: Int) -> Bool {

        if let hole = board.index(of: 16),
            let indexNumber = board.index(of: number) {

            if (hole - 1) == indexNumber ||
                (hole + 1) == indexNumber ||
                (hole - 4) == indexNumber ||
                (hole + 4) == indexNumber {

                let holeIndex = hole + 1

                let isHoleOnRightSide       = (holeIndex % 4 == 0)
                let isHoleNearToSomething   = (holeIndex == indexNumber)
                let isSelectedNumberOnRightSide = ((indexNumber + 1) % 4 == 0)
                let isSelectedNumberLeftToHole  = (indexNumber + 1 == hole)

                if (isHoleOnRightSide && isHoleNearToSomething) ||
                    (isSelectedNumberOnRightSide && isSelectedNumberLeftToHole) {
                    return false
                }
                return true
            }
        }
        
        return false
    }
    
    
    func move(number: Int){
        
        if canMove(number: number ){
            
            if let indexHole = board.index(of: 16), let indexNumber = board.index(of: number){
                
                let valHole = board[indexHole]
                
                board[indexHole] = board[indexNumber]
                
                board[indexNumber] = valHole
                
                
            }
            
        }
        
    }
    
    
    func shuffle() {
        
        var times = 0
        while times < difficulty.rawValue {
            let random = Int(arc4random_uniform(15) + 1)
            move(number: random)
            times += 1;
        }
        
    }
    
    func arrayButtons() -> [Any]{
        
        var arrayAny: [Any] = board
        if let indexHole = board.index(of: dim){
            arrayAny[indexHole] = ""
        }
        
        return arrayAny
        
    }
    
    
    
}
