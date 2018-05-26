//
//  DeleteTama.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/22.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

//piacesの各spriteのcolorにアクセスする。それで連鎖するとこわかる
/*
 
 まず消えるとこ全部消す（横でアクセス）消したとこはspriteを変更する色と画像変更。次に縦アクセス。その後落とす。
 
 3つで消去　４以上は３つで切る
 
 */
class DeleteTama{
    
    private var piaces:[[Tama]]
    private var deleteCount:Int = 0
   
    
    init (piaces:[[Tama]]){
        self.piaces = piaces
    }
    
    func delete(){
        
        saikiDelte(count: 0, i: 0, j: 0)
        
    }
    
    /*
      for i in 0..<Board.size{
        if(piaces[i][0].sprite.color == piaces[i][1].sprite.color && piaces[i][1].sprite.color == piaces[i][2].sprite.color){
            //画像と色を変更する
            piaces[i][0].sprite.color = UIColor.clear
            piaces[i][0].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            piaces[i][1].sprite.color = UIColor.clear
            piaces[i][1].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            piaces[i][2].sprite.color = UIColor.clear
            piaces[i][2].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            
            deleteCount += 1
            GameScene.syokyoTamaCount += 1
            
        }
        
        if(piaces[i][3].sprite.color == piaces[i][4].sprite.color && piaces[i][4].sprite.color == piaces[i][5].sprite.color){
            //画像と色を変更する
            print("$$$$$$$$$$$$$ok")
            piaces[i][3].sprite.color = UIColor.clear
            piaces[i][3].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            piaces[i][4].sprite.color = UIColor.clear
            piaces[i][4].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            piaces[i][5].sprite.color = UIColor.clear
            piaces[i][5].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            
            deleteCount += 1
            GameScene.syokyoTamaCount += 1

            
        }
      }
         
    if(deleteCount > 0){
        GameScene.syokyoFlag = true
    }

    */
    
    
    /*
     玉のアクセス ３個続いていたらそこは消去
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
    

    
    
    func saikiDelte(count:Int,i:Int,j:Int){
        print(count)
        print("saikiDelte!!!!!!!!!!!!!!!!!!!")
        var getCount = count
        var methodi = i
        var methodj = j
        
        
        //カウント2で消去
        if(count == 2){
            //画像と色を変更する
            piaces[i][j-2].sprite.color = UIColor.clear
            piaces[i][j-2].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            piaces[i][j-1].sprite.color = UIColor.clear
            piaces[i][j-1].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            piaces[i][j].sprite.color = UIColor.clear
            piaces[i][j].sprite.texture = SKTexture(imageNamed:"syokyo.png")
            deleteCount += 1
            GameScene.syokyoTamaCount += 1
            getCount = 0
            GameScene.syokyoFlag = true
        }
        
        
        print("methodi" , methodi)
        print("methodj" , methodj)
        
        
        //jが多すぎるとき０に戻すまたiのとこは一個上にする。
        if(j == Board.size-1){
            methodi = i+1
            if(methodi > Board.size){
                return
            }
            methodj = 0
            getCount = 0
        }
        
        //再帰アルゴリズムの核となるところ。（やる前にi,jの大きさ判定する）
        if( methodi < Board.size && methodj+1 < Board.size){
            print("//再帰アルゴリズムの核となるところ。")
            if(piaces[methodi][methodj].sprite.color == piaces[methodi][methodj+1].sprite.color) {
                print("(piaces[methodi][methodj].sprite.color == piaces[methodi][methodj+1].sprite.color OK")
                let afterCount : Int = getCount + 1;
                let getj = methodj + 1
                saikiDelte(count: afterCount,i:methodi,j: getj);
                return
            }
            else{
                let afterCount : Int = 0;
                let getj = methodj + 1
                saikiDelte(count: afterCount,i:methodi,j: getj);
                return
            }
        }
        //2つとも大きすぎるとき終了
        else {
            return
        }
        
    }
        
}
    



