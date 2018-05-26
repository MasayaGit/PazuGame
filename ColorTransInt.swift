//
//  ColorTransInt.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/25.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit
class ColorTransInt{
    
    
    //下の宣言はpiaces[xx][xx]がの色がclearかの判定に使う
    let ifClearSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.clear, size: CGSize(width: 6, height: 6))
    
    //下の宣言はpiaces[xx][xx]がの色がblueかの判定に使う
    let ifBlueSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.blue, size: CGSize(width: 6, height: 6))
    
    //下の宣言はpiaces[xx][xx]がの色がgreenかの判定に使う
    let ifGreenSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.green, size: CGSize(width: 6, height: 6))
    
    //下の宣言はpiaces[xx][xx]がの色がredかの判定に使う
    let ifRedSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.red, size: CGSize(width: 6, height: 6))
    
    //下の宣言はpiaces[xx][xx]がの色がpurpleかの判定に使う
    let ifPurpleSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.purple, size: CGSize(width: 6, height: 6))
    //下の宣言はpiaces[xx][xx]がの色がyellowかの判定に使う
    let ifYellowSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.yellow, size: CGSize(width: 6, height: 6))
    //下の宣言はpiaces[xx][xx]がの色がorandeかの判定に使う
    let ifOrangeSprite: SKSpriteNodeWithLabel =
        SKSpriteNodeWithLabel(color: UIColor.orange, size: CGSize(width: 6, height: 6))
    
    
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

    func colorTransInt (ifColor: SKSpriteNodeWithLabel) -> Int {
    
    
    if(ifColor.color == ifBlueSprite.color){
    
    //青色の数字返す
    return  1
    
    }
    if( ifColor.color == ifGreenSprite.color){
    
    //緑色の数字返す
    return  2

    
    }
    if( ifColor.color == ifRedSprite.color){
    
    //赤色の数字返す
    return  3

    
    }
    if(ifColor.color == ifPurpleSprite.color){
    
    //紫色の数字返す
    return  4
    
    }
    if(ifColor.color == ifYellowSprite.color){
        
    //紫色の数字返す
    return  5

       
    }
    if(ifColor.color == ifOrangeSprite.color){
    
    //オレンジ色の数字返す
    return  6
        
    }
    else{
    //エラー
    return 1000
    }
 }

}
