//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Justinas Alisauskas on 02/02/2016.
//  Copyright © 2016 JustInCode. All rights reserved.
//

import UIKit

var turnPressed = false
var turn:String = "Nought"
var buttonStatus = [false, false, false, false, false, false, false, false, false]
var buttonValue = [0, 0, 0, 0, 0, 0, 0, 0, 0]

class ViewController: UIViewController {
    
    @IBOutlet var mainGrid: UIImageView!
    
    @IBOutlet var restartButtonText: UIButton!
    @IBAction func restartButton(sender: AnyObject) {
        restartButtonText.setTitle("Restart", forState: UIControlState.Normal)
        buttonStatus = [false, false, false, false, false, false, false, false, false]
        let buttons = [button11, button12, button13, button21, button22, button23, button31, button32, button33]
        buttonValue = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        for button in buttons as! [UIButton] {
            button.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Normal)
        }
    }
    
    @IBOutlet var firstText: UIButton!
    @IBAction func firstButton(sender: AnyObject) {
        if (turn == "Nought" && !turnPressed){
            turn = "Cross"
            firstText.setTitle("Crosses First", forState: .Normal)
        }else if(turn == "Cross" && !turnPressed){
            turn = "Nought"
            firstText.setTitle("Noughts First", forState: .Normal)
        }
    }
    
    //Controls for all 9 buttons
    @IBOutlet var button11: UIButton!
    @IBAction func button11press(sender: AnyObject) {
        if(!buttonStatus[0]){
            onPress(button11,number:0)
            print("pressed1")
        }
    }
    
    @IBOutlet var button21: UIButton!
    @IBAction func button21press(sender: AnyObject) {
        if(!buttonStatus[1]){
            onPress(button21,number:1)
            print("pressed2")
        }
    }
    
    @IBOutlet var button31: UIButton!
    @IBAction func button31press(sender: AnyObject) {
        if(!buttonStatus[2]){
            onPress(button31,number:2)
            print("pressed3")
        }
    }
    
    @IBOutlet var button12: UIButton!
    @IBAction func button12(sender: AnyObject) {
        if(!buttonStatus[3]){
            onPress(button12,number:3)
            print("pressed4")
        }
    }
    
    @IBOutlet var button22: UIButton!
    @IBAction func button22press(sender: AnyObject) {
        if(!buttonStatus[4]){
            onPress(button22,number:4)
            print("pressed5")
        }
    }
    
    @IBOutlet var button32: UIButton!
    @IBAction func button32press(sender: AnyObject) {
        if(!buttonStatus[5]){
            onPress(button32,number:5)
            print("pressed6")
        }
    }
    
    @IBOutlet var button13: UIButton!
    @IBAction func button13press(sender: AnyObject) {
        if(!buttonStatus[6]){
            onPress(button13,number:6)
            print("pressed7")
        }
    }
    
    @IBOutlet var button23: UIButton!
    @IBAction func button23press(sender: AnyObject) {
        if(!buttonStatus[7]){
            onPress(button23,number:7)
            print("pressed8")
        }
    }
    
    @IBOutlet var button33: UIButton!
    @IBAction func button33press(sender: AnyObject) {
        if(!buttonStatus[8]){
            onPress(button33,number:8)
            print("pressed9")
        }
    }
    
    
    
    func noughtsOrCrosses(sum: Int) -> String{
        if(sum > 0){
            buttonStatus = [true, true, true, true, true, true, true, true, true]
            restartButtonText.setTitle("Noughts WIN! Rematch?", forState: .Normal)
            return("Noughts WIN! Rematch?")
        }else{
            buttonStatus = [true, true, true, true, true, true, true, true, true]
            restartButtonText.setTitle("Crosses WIN! Rematch?", forState: .Normal)
            return("Crosses WIN! Rematch?")
        }
    }
    
    func isWin(){
        var x = 0
        var i = 0
        while i < 7{
            print(i)
            x = buttonValue[i] + buttonValue[i+1] + buttonValue[i+2]
            if (abs(x) == 3){
                print(self.noughtsOrCrosses(x))
            }
            i = i + 3
        }
        
        i = 0
        while i < 3{
            x = buttonValue[i] + buttonValue[i+3] + buttonValue[i+6]
            if (abs(x) == 3){
                print(self.noughtsOrCrosses(x))
            }
            i = i + 1
        }
        
        x = buttonValue[0] + buttonValue[4] + buttonValue[8]
        if (abs(x) == 3){
            print(self.noughtsOrCrosses(x))
            
        }else{
            x = buttonValue[2] + buttonValue[4] + buttonValue[6]
            if (abs(x) == 3){
                print(self.noughtsOrCrosses(x))
            }
        }
        
    }
        
    func onPress(butt: UIButton, number: Int){
        turnPressed = true
        buttonStatus[number] = true
        if turn == "Nought"{
            butt.setBackgroundImage(UIImage(named: "nought"), forState: UIControlState.Normal)
            buttonValue[number] = 1
            turn = "Cross"
        }else{
            butt.setBackgroundImage(UIImage(named: "cross"), forState: UIControlState.Normal)
            buttonValue[number] = -1
            turn = "Nought"
        }
        isWin()
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

