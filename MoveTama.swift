//
//  MoveTama.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/21.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit

//フィールドで持っている玉と移動先で接触する玉を格納
class MoveTama{
    
    private var touchedNode : SKNode = SKNode()
    private var moveTamaNode: SKNode = SKNode()
    private(set) var touchedX:Int = 1000
    private(set) var touchedY:Int = 1000
    private(set) var moveX:Int = 1000
    private(set) var moveY:Int = 1000
    
    
    var nodeMoveSort: NodeMoveSort = NodeMoveSort()
    
    //他のアニメショーンが動かないようにするやつ処理終わったらfalseにする
    private(set) var moveActionFlag = false
    
    //セッター そのNodeと同じやつを２次元配列の中から見つける
    func setTouchedNode (node : SKNode , piaces:[[Tama]]){
        self.touchedNode = node
        
        for i in 0..<Board.size{
            for j in 0..<Board.size{
                if(piaces[i][j].point == self.touchedNode.position){
                    touchedX = j
                    touchedY = i
                }
            }
        }
        //移動後、NodeMoveSortでspriteのソートする。先に最初にtouchされたやつの情報を渡す
        nodeMoveSort.setTouchedXY(touchedX:touchedX,touchedY:touchedY)
    }
    //セッター　そのNodeと同じやつを２次元配列の中から見つける
    func setmoveTamaNode (node : SKNode , piaces:[[Tama]]){
        self.moveTamaNode = node
        for i in 0..<Board.size{
            for j in 0..<Board.size{
                if(piaces[i][j].point == self.moveTamaNode.position){
                    moveX = j
                    moveY = i
                }
            }
        }
    }
    //玉の移動。持っている玉と接触する玉の場所を交換する
    func move(piaces:[[Tama]]) {
        
        
        let touchedAction = SKAction.move(to: self.moveTamaNode.position, duration: 0.10)
        let passeagedAction = SKAction.move(to: touchedNode.position, duration: 0.10)
        
        moveActionFlag = true
        touchedNode.run(touchedAction, completion: {self.moveActionFlag = false})
        moveTamaNode.run(passeagedAction, completion: {self.moveActionFlag = false})
        
        print(touchedY,"MoveTamaTouchedY")
        print(touchedX,"MoveTamaTouchedX")
        print(moveY, "MoveTamaMoveY")
        print(moveX ,"MoveTamaMoveX")
        print(nodeMoveSort.getfirstMoveY(),"MoveTamaクラスのmoveメソッドでnodeMoveSort.getfirstMoveY()")
        print(nodeMoveSort.getfirstMoveX(),"MoveTamaクラスのmoveメソッドでnodeMoveSort.getfirstMoveX()")
        //NodeMoveSortでspriteのソート
        if(nodeMoveSort.getfirstMoveX() != moveX || nodeMoveSort.getfirstMoveY() != moveY){
        nodeMoveSort.setSecondMoveXY(secondMoveX: moveX, secondMoveY: moveY)
        nodeMoveSort.afterMoveSort(piaces:piaces)
        print("MoveTamaMoveIfOK")
        }
    }
    
    
 
}
