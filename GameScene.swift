//
//  GameScene.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/20.
//  Copyright © 2018年 masamon. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var board: Board!
    var moveTama: MoveTama = MoveTama()
    static var nodeMoveSortFinishFlag = false
    var piaceLayer = SKNode()
    static var syokyoFlag = false
    
    static var syokyoTamaCount:Int = 0
    
    var limitTime:Int = 0
    
    
    

    override func didMove(to view: SKView) {
        
        /*
         制限時間バー
        */
        
        
        let barNode = SKSpriteNode(color: UIColor.white, size: CGSize(width: self.frame.size.width, height: self.frame.size.height*0.015))
        
        //制限時間バーの位置。
        barNode.position = CGPoint(x:0,y:600)
        barNode.name = "bar"
        
        let barAction = SKAction.move(to: CGPoint(x: 0 - self.frame.size.width , y: 600) , duration: 20)
        
        barNode.run(barAction, completion: {
            print("barAction completion")
            let newScene = GameScene(fileNamed: "FinishGameScene")
            newScene?.scaleMode = SKSceneScaleMode.aspectFill
            self.view!.presentScene(newScene)
        })
        

        
        /*
         背景作成
         */
        
        //背景画像のノードを作成する。
        //背景画像のサイズをシーンと同じにする。
        //let backNode = SKSpriteNode(color: UIColor.darkGray, size: /self.frame.size)
        
        let backNode = SKSpriteNode(color: UIColor.darkText, size: self.frame.size)
        
        //背景画像の位置をシーンの中央にする。
        backNode.position = CGPoint(x:0,y:200)
        backNode.name = "back"
        
        /*
         玉作成 piacelayer(Node型)に追加する
         （２次元配列） Boardで管理
         */
        
        
        let piaceSize = CGSize(width: self.frame.size.width.i, height: self.frame.size.width.i)
        
        board = Board(piaceSize : piaceSize)
        
        //Board.piacesにアクセスし
        //Piaceクラスが持つspriteをpiaceLayerにaddChildする.
        //staticだからsize使える Boardクラスのsize
        for i in 0..<Board.size{
            for j in 0..<Board.size{
                //nodeにnodeを追加できる。だからnodeをlayerとしてみなしnodeのboard.piaces[i][j].spriteを追加する。動くやつと動かないやつを作る
                piaceLayer.addChild(board.piaces[i][j].sprite)
            }
        }

        
        //ノードをシーンに追加する。
        self.addChild(backNode)
        self.addChild(barNode)
        self.addChild(piaceLayer)
       
        
    }
    
    //押したタイルを特定し、それをmoveTamaクラスに渡す
    //押したタイルの色をちょっと薄くする
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("TouchBeganOk")
        //押したnodeをfor文の中で特定する
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            moveTama.setTouchedNode(node: touchedNode,piaces: board.piaces)
        }
    }
    
    //移動先で接触するタイルをmoveTamaクラスに渡した後moveメソッドを起動
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("TouchMovedOk")
        for touch in touches {
            let location = touch.location(in: self)
            let moveTamaNode = self.atPoint(location)
            if(moveTamaNode.name != "bar" && moveTamaNode.name != "back"){
                moveTama.setmoveTamaNode(node:moveTamaNode,piaces: board.piaces)
                if(!moveTama.moveActionFlag){
                    moveTama.move(piaces:board.piaces)
                    
                    while (GameScene.nodeMoveSortFinishFlag != true ){
                        //他のコードに行かないように停止させる
                    }
                    GameScene.nodeMoveSortFinishFlag != false
                }
            }
            
        }
    }
    
    //タッチ終了後　色を元に戻す 中の色の情報が移動後と一致するようにソート　連鎖スタート
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        print("TouchEndOk")
        //MoveTamaにあるNodeMoveSortをリセット
        moveTama.nodeMoveSort.reset()
        let delete : DeleteTama = DeleteTama(piaces: board.piaces)
        delete.delete()
        
        //もし消えるとこ出たらdeleteAfterIf呼び出す
        if(GameScene.syokyoFlag){
            deleteAfterIf()
        }
        
        GameScene.syokyoFlag = false
        
      //  let tamaInfo:TamaInformation =  TamaInformation(piaces:board.piaces)
      // tamaInfo.printInfo()
     }
    
    //もし消えるとこ出たらこれ呼び出す
     func deleteAfterIf(){
        
        //piaceLayerを一旦消して新しいの作る　delteしたあと作る
       // DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // 0.5秒後に実行したい処理
            //addchildした分をSceneから外しただけでpiaceLayer自体は残ってると思うmakeメソッドで新たに作りそれをpiaeLayerに格納するそしてaddchild
            self.removeChildren(in: [self.piaceLayer])
        //}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        self.piaceLayer.removeAllChildren()
        print(self.piaceLayer.children,"self.piaceLayer.children Remove Ok")
        let makeTama:MakeNewTama = MakeNewTama(piaces:self.board.piaces)
        makeTama.make()
        for i in 0..<Board.size{
            for j in 0..<Board.size{
                //nodeにnodeを追加できる。だからnodeをlayerとしてみなしnodeのboard.piaces[i][j].spriteを追加する。動くやつと動かないやつを作る
                //print("deleteAfterIf()OK")
                //piaceLayer.addChild()
                self.piaceLayer.addChild(self.board.piaces[i][j].sprite)
                
            }
         }
        }
        self.addChild(piaceLayer)
    }
        
    
    
    func center(size: CGSize)-> CGRect{
        let width = self.size.width / 2
        let height = self.size.height / 2
        let sWidth = size.width / 2
        let sHeight = size.height / 2
        return CGRect(x: width - sWidth, y: height - sHeight, width: size.width, height: size.height)
    }
}
