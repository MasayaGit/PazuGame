//
//  Tama.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/20.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

///ラベル付きSKSpriteNode(このspriteをpiaceLayerに格納するこれで玉を画面に表示する)
class SKSpriteNodeWithLabel: SKSpriteNode{
    private(set) var labelNode: SKLabelNode!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize){
        super.init(texture: texture,color: color,size: size)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp(){
        labelNode = SKLabelNode()
        self.addChild(labelNode)
    }
}




/*
 玉の種類はnumで管理する
 numによって出力する写真を決める
 1:blue
 2:green
 3:red
 4:purple
 5:yellow
 6:orange
 */



class Tama {
    ///SpriteKitで使うノード
    var sprite: SKSpriteNodeWithLabel
 
    ///現在の自身の数字(玉の色)
    var num: Int
    
    var point: CGPoint
    
    
    //コンストラクタで初期値代入
    init(point: CGPoint, num: Int,size:CGSize){
        
    let setView : SetView = SetView()
    let setColor : SetColor = SetColor()
        
    sprite = SKSpriteNodeWithLabel(texture:setView.setView(num),color:setColor.setColor(num),size:size)
    
    sprite.position = CGPoint(x: point.x,y: point.y)
    
    self.num = num
    self.point = point
        
        
        
    }
    
    
    
   
    
}

    
