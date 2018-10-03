//
//  NodeMoveSort.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/21.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

class NodeMoveSort{
    
    private var touchedX:Int = 1000
    private var touchedY:Int = 1000
    private var firstMoveX:Int = 1000
    private var firstMoveY:Int = 1000
    private var secondMoveX:Int = 1000
    private var secondMoveY:Int = 1000
    private var count:Int = 0

    
    func setTouchedXY (touchedX:Int,touchedY:Int){
         self.touchedX = touchedX
         self.touchedY = touchedY
    }
    
    func setFirstMoveXY(firstMoveX:Int,firstMoveY:Int){
        self.firstMoveX = firstMoveX
        self.firstMoveY = firstMoveY
    }
    
    func setSecondMoveXY(secondMoveX:Int,secondMoveY:Int){
        self.secondMoveX = secondMoveX
        self.secondMoveY = secondMoveY
    }
    
    func getfirstMoveX() -> Int{
        return self.firstMoveX
    }
    func getfirstMoveY() -> Int{
        return self.firstMoveY
    }
    func reset(){
        touchedX = 1000
        touchedY = 1000
        firstMoveX = 1000
        firstMoveY = 1000
        secondMoveX = 1000
        secondMoveY = 1000
        count = 0

    }
    
    //node移動後　玉のspriteを交換(失敗)
    func afterMoveSort(piaces:[[Tama]]){
        
        //最初の移動とそれ以降の移動で処理変わる　最初はtouchedを使った処理
        if(count == 0){
            
            firstMoveY = secondMoveY
            firstMoveX = secondMoveX
            
            print("_________firstsortIf______")
            print("firstMoveX",firstMoveX)
            print("firstMoveY",firstMoveY)
            print("touchedX",touchedX)
            print("touchedY",touchedY)
            
            if(firstMoveY>=0 && firstMoveY<=5){
            if(firstMoveX>=0 && firstMoveX<=5){
            if(touchedX>=0 && touchedX<=5){
            if(touchedY>=0 && touchedY<=5){
                print("_______firstsortStepOne")
                if(firstMoveY != touchedY || firstMoveX != touchedX){
                count += 1
                let hako =  piaces[firstMoveY][firstMoveX].sprite
                piaces[firstMoveY][firstMoveX].sprite = piaces[touchedY][touchedX].sprite
                piaces[touchedY][touchedX].sprite = hako
                    
                print("_______firstsort")
                }
            }
            }
            }
            }
        }
        else{
            print("_________secondsortElse______")
                if(firstMoveY>=0 && firstMoveY<=5){
                if(firstMoveX>=0 && firstMoveX<=5){
                if(secondMoveY>=0 && secondMoveY<=5){
                if(secondMoveX>=0 && secondMoveX<=5){
                    let hako =  piaces[firstMoveY][firstMoveX].sprite
                    piaces[firstMoveY][firstMoveX].sprite = piaces[secondMoveY][secondMoveX].sprite
                    piaces[secondMoveY][secondMoveX].sprite = hako
                    print("_________secondsort")
                    
                    //次のfirstmoveでは今回のsecondが使われる。
                    firstMoveY  = secondMoveY
                    firstMoveX = secondMoveX
                    
                }
                }
                }
                }
        }
        
        GameScene.nodeMoveSortFinishFlag = true
        
    }
   
   
    
}
