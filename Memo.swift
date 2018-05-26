//
//  Memo.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/21.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
/*
 
 
 メモ
 
 */



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



/*
 玉の情報の出力
 */
/*for i in 0..<Board.size{
    for j in 0..<Board.size{
        print(piaces[i][j].sprite.color)
        print(piaces[i][j].num)
        if(j == Board.size-1){
            print("改行")
        }
    }
}
*/


/*
 玉の移動後　玉の数値もそれに合うように移動させる（失敗作）
 */

/*
if(moveY>=0 && moveY<=5){
    if(moveX>=0 && moveX<=5){
        if(touchedX>=0 && touchedX<=5){
            if(touchedY>=0 && touchedY<=5){
                
                let numberHako =  piaces[moveY][moveX].num
                
                piaces[moveY][moveX].num = piaces[touchedY][touchedX].num
                
                piaces[touchedY][touchedX].num = numberHako
            }
        }
    }
}
*/



/* //node移動後　玉のspriteを交換(失敗)
 if(moveY>=0 && moveY<=5){
 if(moveX>=0 && moveX<=5){
 if(touchedX>=0 && touchedX<=5){
 if(touchedY>=0 && touchedY<=5){
 
 let hako =  piaces[moveY][moveX].sprite
 
 piaces[moveY][moveX].sprite = piaces[touchedY][touchedX].sprite
 
 piaces[touchedY][touchedX].sprite = hako
 
 
 }
 }
 }
 }
 */



/*
 
 //画像と色を変更する
 piaces[i][j-2].sprite.color = UIColor.clear
 piaces[i][j-2].sprite.texture = SKTexture(imageNamed:"syokyo.png")
 piaces[i][j-1].sprite.color = UIColor.clear
 piaces[i][j-1].sprite.texture = SKTexture(imageNamed:"syokyo.png")
 piaces[i][j].sprite.color = UIColor.clear
 piaces[i][j].sprite.texture = SKTexture(imageNamed:"syokyo.png")
 
 */


/*
 
 //一番上の一個下まで以下のソートでやる(失敗)
 for i in 0..<Board.size-1{
 for j in 0..<Board.size-1{
 //縦列ごとにチェックする j i の位置に注意
 //下の宣言はpiaces[xx][xx]がの色がclearかの判定
 let ifClearSprite: SKSpriteNodeWithLabel =
 SKSpriteNodeWithLabel(color: UIColor.clear, size: CGSize(width: 6, height: 6))
 
 if (piaces[j][i].sprite.color == ifClearSprite.color){
 print("piaces[j][i].sprite.color == ifClearSprite.colorOK")
 piaces[j][i].sprite.color = piaces[j+1][i].sprite.color
 if(j+1 < 6 && j+2 < 6){
 piaces[j+1][i].sprite.color = piaces[j+2][i].sprite.color
 if(j+3 < 6){
 piaces[j+2][i].sprite.color = piaces[j+3][i].sprite.color
 if(j+4 < 6){
 piaces[j+3][i].sprite.color = piaces[j+4][i].sprite.color
 if(j+5 < 6){
 piaces[j+4][i].sprite.color = piaces[j+5][i].sprite.color
 
 piaces[j+5][i].sprite.color = setcolor.setColor(Int(random.arc4random(lower: 1, upper: 7)))
 }
 }
 }
 }
 }
 }
 }

 */


/*
 //この「ref」でこのツリー全体のrootを示す。
 ref = Database.database().reference()
 //refの下に「child()」で場所を示す。今回の場合は「Group」
 ref.child("Gruop").observe(.value, with: { (snapshot) in
 */
