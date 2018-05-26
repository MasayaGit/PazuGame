//
//  SetColor.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/20.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

class SetView{
    /// 自身の数字を新しい数字に更新
    /// ラベルのテキストを自身の数字に更新
    func setView(_ num: Int) -> SKTexture{
        
        /*self.num = num
         //キャストStringh型へ
         let StringNumber:String = String(self.num)
         sprite.texture = SKTexture(imageNamed:StringNumber)
         */
        
        //参考
        // let texture: SKTexture = SKTexture(imageNamed: "frame.png")
        
        
        ///SpriteKitで使うノード
        //上でこういうコードある
        //private(set) var sprite: SKSpriteNodeWithLabel
        
        
        /*
         玉の種類はnumで管理する
         numによって出力する写真を決める
         1:blue
         2:green
         3:red
         4:purple
         5:yellow
         6:orange
         7:消去
         else:エラー
         */
        
        if num == 1{
            return SKTexture(imageNamed:"blue.png")
        }
        if num == 2{
            return  SKTexture(imageNamed:"green.png")
        }
        if num == 3{
            return  SKTexture(imageNamed:"red.png")
        }
        if num == 4{
            return SKTexture(imageNamed:"purple.png")
        }
        if num == 5{
            return SKTexture(imageNamed:"yellow.png")
        }
        if num == 6{
            return  SKTexture(imageNamed:"orange.png")
        }
        if num == 7{
            return  SKTexture(imageNamed:"syokyo.png")
        }
        else {
            return SKTexture(imageNamed: "error")
        }
    }
    
}
