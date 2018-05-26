//
//  MakeNewTama.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/23.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

class MakeNewTama {
    
    var piaces:[[Tama]]
    private let setcolor : SetColor = SetColor()
    private let setView : SetView = SetView()
    private let random : Random = Random()
    private let colorTransInt : ColorTransInt =  ColorTransInt()
    
    /*
    1:blue
    2:green
    3:red
    4:purple
    5:yellow
    6:orange
    */

    
    /*
     sprite = SKSpriteNodeWithLabel(texture:setView.setView(num),color:setColor.setColor(num),size:size)
     
     sprite.position = CGPoint(x: point.x,y: point.y)
     */
    
    /*
     Int(random.arc4random(lower: 1, upper: 7))
     */
    
    //下の宣言はpiaces[xx][xx]がの色がclearかの判定に使う
    let ifClearSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.clear, size: CGSize(width: 6, height: 6))
    
    init (piaces:[[Tama]]){
        self.piaces = piaces
    }
    
    func make(){
        deleteAfterSort()
        print("&&&&&&MakeNewTamaのmake()&&&&&&&")
        let tamaInfo : TamaInformation = TamaInformation(piaces:piaces)
        tamaInfo.printInfo()
        print("ここまで&&&&&&MakeNewTamaのmake()&&&&&&&")

    }
    
    //ソート。それぞれの縦列を一個下に下ろす。sprite新しく作る 情報に合わせて
    func deleteAfterSort(){
        
        
        //横軸のループに使う
        for i in 0..<Board.size {
            //まず一番上が連鎖の時の判定
            if (piaces[5][i].sprite.color == ifClearSprite.color){
                
                let randomIntHako =  Int(random.arc4random(lower: 1, upper: 7))
                print(randomIntHako,"randomIntHakoの数字")
                let hako = piaces[5][i].sprite
                piaces[5][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(randomIntHako),color:setcolor.setColor(randomIntHako),size:piaces[5][i].sprite.size)
                piaces[5][i].sprite.position = hako.position

            }
            //2番上
            if (piaces[4][i].sprite.color == ifClearSprite.color){
                
                let hako4 = piaces[4][i].sprite
                
                piaces[4][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),size:piaces[4][i].sprite.size)
                
                print(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite),
                      "xxxxxcolorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)xxxxx")
                
                piaces[4][i].sprite.position = hako4.position
                
                let randomIntHako =  Int(random.arc4random(lower: 1, upper: 7))
                let hako = piaces[5][i].sprite
                piaces[5][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(randomIntHako),color:setcolor.setColor(randomIntHako),size:piaces[5][i].sprite.size)
                piaces[5][i].sprite.position = hako.position

            }
            //3番上
            if (piaces[3][i].sprite.color == ifClearSprite.color){
                
                 let hako3 = piaces[3][i].sprite
                
                piaces[3][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),size:piaces[3][i].sprite.size)
                
                piaces[3][i].sprite.position = hako3.position
                
                let hako4 = piaces[4][i].sprite
                
                piaces[4][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),size:piaces[4][i].sprite.size)
                
                piaces[4][i].sprite.position = hako4.position
                
                let randomIntHako =  Int(random.arc4random(lower: 1, upper: 7))
                let hako = piaces[5][i].sprite
                piaces[5][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(randomIntHako),color:setcolor.setColor(randomIntHako),size:piaces[5][i].sprite.size)
                piaces[5][i].sprite.position = hako.position
                
                
            }
            //4番上
            if (piaces[2][i].sprite.color == ifClearSprite.color){
                
                let hako2 = piaces[2][i].sprite
             
                piaces[2][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[3][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[3][i].sprite)),size:piaces[2][i].sprite.size)
                
                piaces[2][i].sprite.position = hako2.position
                
                let hako3 = piaces[3][i].sprite
                
                piaces[3][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),size:piaces[3][i].sprite.size)
                
                piaces[3][i].sprite.position = hako3.position
                
                let hako4 = piaces[4][i].sprite
                
                piaces[4][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),size:piaces[4][i].sprite.size)
                
                piaces[4][i].sprite.position = hako4.position
                
                let randomIntHako =  Int(random.arc4random(lower: 1, upper: 7))
                let hako = piaces[5][i].sprite
                piaces[5][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(randomIntHako),color:setcolor.setColor(randomIntHako),size:piaces[5][i].sprite.size)
                piaces[5][i].sprite.position = hako.position
            }
            //５番上
            if (piaces[1][i].sprite.color == ifClearSprite.color){
                
                let hako1 = piaces[1][i].sprite
                
                piaces[1][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[2][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[2][i].sprite)),size:piaces[1][i].sprite.size)
                
                piaces[1][i].sprite.position = hako1.position
            
                let hako2 = piaces[2][i].sprite
                
                piaces[2][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[3][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[3][i].sprite)),size:piaces[2][i].sprite.size)
                
                piaces[2][i].sprite.position = hako2.position
                
                let hako3 = piaces[3][i].sprite
                
                piaces[3][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),size:piaces[3][i].sprite.size)
                
                piaces[3][i].sprite.position = hako3.position
                
                let hako4 = piaces[4][i].sprite
                
                piaces[4][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),size:piaces[4][i].sprite.size)
                
                piaces[4][i].sprite.position = hako4.position
                
                let randomIntHako =  Int(random.arc4random(lower: 1, upper: 7))
                let hako = piaces[5][i].sprite
                piaces[5][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(randomIntHako),color:setcolor.setColor(randomIntHako),size:piaces[5][i].sprite.size)
                piaces[5][i].sprite.position = hako.position
            
            }
            
            //６番上（一番下）
            if (piaces[0][i].sprite.color == ifClearSprite.color){
               
                let hako0 = piaces[0][i].sprite
                
                piaces[0][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[1][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[1][i].sprite)),size:piaces[0][i].sprite.size)
                
                piaces[0][i].sprite.position = hako0.position

                let hako1 = piaces[1][i].sprite
                
                piaces[1][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[2][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[2][i].sprite)),size:piaces[1][i].sprite.size)
                
                piaces[1][i].sprite.position = hako1.position
                
                let hako2 = piaces[2][i].sprite
                
                piaces[2][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[3][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[3][i].sprite)),size:piaces[2][i].sprite.size)
                
                piaces[2][i].sprite.position = hako2.position
                
                let hako3 = piaces[3][i].sprite
                
                piaces[3][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[4][i].sprite)),size:piaces[3][i].sprite.size)
                
                piaces[3][i].sprite.position = hako3.position
                
                let hako4 = piaces[4][i].sprite
                
                piaces[4][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),color:setcolor.setColor(colorTransInt.colorTransInt(ifColor: piaces[5][i].sprite)),size:piaces[4][i].sprite.size)
                
                piaces[4][i].sprite.position = hako4.position
                
                let randomIntHako =  Int(random.arc4random(lower: 1, upper: 7))
                let hako = piaces[5][i].sprite
                piaces[5][i].sprite = SKSpriteNodeWithLabel(texture:setView.setView(randomIntHako),color:setcolor.setColor(randomIntHako),size:piaces[5][i].sprite.size)
                piaces[5][i].sprite.position = hako.position

            }
        }
    }

}
