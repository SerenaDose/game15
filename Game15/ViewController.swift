//
//  ViewController.swift
//  Game15
//
//  Created by Serena Dose on 25/08/2017.
//  Copyright © 2017 Serena Dsoe. All rights reserved.
//

import UIKit

enum GameDifficulty: Int {
    case easy = 50, medium = 500
}

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: GameUIButton!
    @IBOutlet weak var buttonTwo: GameUIButton!
    @IBOutlet weak var buttonThree: GameUIButton!
    @IBOutlet weak var buttonFour: GameUIButton!
    @IBOutlet weak var buttonFive: GameUIButton!
    @IBOutlet weak var buttonSix: GameUIButton!
    @IBOutlet weak var buttonSeven: GameUIButton!
    @IBOutlet weak var buttonEight: GameUIButton!
    @IBOutlet weak var buttonNine: GameUIButton!
    @IBOutlet weak var buttonTen: GameUIButton!
    @IBOutlet weak var buttonEleven: GameUIButton!
    @IBOutlet weak var buttonTwelve: GameUIButton!
    @IBOutlet weak var buttonThirteen: GameUIButton!
    @IBOutlet weak var buttonFourteen: GameUIButton!
    @IBOutlet weak var buttonFifteen: GameUIButton!
    @IBOutlet weak var buttonSixteen: GameUIButton!
    @IBOutlet weak var labelStatus: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor(red: 128/255.5, green: 208/255.5, blue: 199/255.5, alpha: 1).cgColor, UIColor(red: 19/255.5, green: 84/255.5, blue: 122/255.5, alpha: 1).cgColor]
        gradientLayer.locations = [0.0, 0.6]
        gradientLayer.startPoint = CGPoint (x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint (x: 0.5, y: 1.5)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    
 
        newGame(diff: .medium)
    }

    var currentGame: Game!
    
    var moves = 0

    func newGame(diff: GameDifficulty){
        
        moves = 0
        labelStatus.text = "Moves: \(moves)"
        currentGame = Game(difficulty: diff)
        currentGame.shuffle()
        //avoid didn't shuffle in easy mode
        if diff == .easy {
            
            if currentGame.sorted(){
                
                while currentGame.sorted() {
                    currentGame.shuffle()
                }
            }
        }
        updateUI()
        
    }
    
    @IBAction func gameButtonsPressed(_ sender: UIButton) {
        
        let string = sender.title(for: .normal)!
        
        if string != ""{
        
        let number = Int(string)
        
        currentGame.move(number: number!)
            if currentGame.canMove(number: number!){
        moves += 1
        labelStatus.text = "Moves: \(moves)"
        updateUI()
            }
            if currentGame.sorted(){
                labelStatus.text = "You win! 😄"
            }
        }
    }
    
    @IBAction func easyButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Game", message: "Are you sure you want to start a new game?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { (action: UIAlertAction!) in
            self.newGame(diff: .easy)
        }))
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func normalButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Game", message: "Are you sure you want to start a new game?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { (action: UIAlertAction!) in
            self.newGame(diff: .medium)
        }))
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func updateUI(){
        
        let arrayButtons = currentGame.arrayButtons()
        
        
        buttonOne.setTitle(String(describing: arrayButtons[0]), for: .normal)
        buttonTwo.setTitle(String(describing: arrayButtons[1]), for: .normal)
        buttonThree.setTitle(String(describing: arrayButtons[2]), for: .normal)
        buttonFour.setTitle(String(describing: arrayButtons[3]), for: .normal)
        buttonFive.setTitle(String(describing: arrayButtons[4]), for: .normal)
        buttonSix.setTitle(String(describing: arrayButtons[5]), for: .normal)
        buttonSeven.setTitle(String(describing: arrayButtons[6]), for: .normal)
        buttonEight.setTitle(String(describing: arrayButtons[7]), for: .normal)
        buttonNine.setTitle(String(describing: arrayButtons[8]), for: .normal)
        buttonTen.setTitle(String(describing: arrayButtons[9]), for: .normal)
        buttonEleven.setTitle(String(describing: arrayButtons[10]), for: .normal)
        buttonTwelve.setTitle(String(describing: arrayButtons[11]), for: .normal)
        buttonThirteen.setTitle(String(describing: arrayButtons[12]), for: .normal)
        buttonFourteen.setTitle(String(describing: arrayButtons[13]), for: .normal)
        buttonFifteen.setTitle(String(describing: arrayButtons[14]), for: .normal)
        buttonSixteen.setTitle(String(describing: arrayButtons[15]), for: .normal)
        
        
           }
    
    @IBAction func unwindToGame(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
}

