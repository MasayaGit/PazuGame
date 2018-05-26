//
//  SetColor.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/21.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

class SetColor{
    func setColor(_ num: Int) -> UIColor{
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
         else：エラー
         */
        
        if num == 1{
            return UIColor.blue
        }
        if num == 2{
            return UIColor.green
        }
        if num == 3{
            return UIColor.red
        }
        if num == 4{
            return UIColor.purple
        }
        if num == 5{
            return UIColor.yellow
        }
        if num == 6{
            return UIColor.orange
        }
        if num == 7 {
            return UIColor.clear
        }
        else {
            return UIColor.brown
        }
    }

}
