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
