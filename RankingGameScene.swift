//
//  RankingGameScene.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/27.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SwiftyJSON

class RankingGameScene : SKScene {
    
    
    //Firebase
    var ref:DatabaseReference!
    var number1 = 0
    var number2 = 0
    var number3 = 0
    var number4 = 0
    var number5 = 0
    
    override func didMove(to view: SKView) {
        
        
        // 「Start」を表示。
        let startLabel = SKLabelNode(fontNamed: "Copperplate")
        startLabel.text = "戻る"
        startLabel.fontSize = 50
        startLabel.position = CGPoint(x: self.frame.midX, y: -400)
        startLabel.name = "StartBack"
        
        
        // １位の表示使う
        let label1 = SKLabelNode(fontNamed: "Copperplate")
        label1.fontSize = 50
        label1.position = CGPoint(x: self.frame.midX, y: 400)
        label1.name = "one"
        
        // 2位の表示使う
        let label2 = SKLabelNode(fontNamed: "Copperplate")
        label2.fontSize = 50
        label2.position = CGPoint(x: self.frame.midX, y: 300)
        label2.name = "second"
        
        // 3位の表示使う
        let label3 = SKLabelNode(fontNamed: "Copperplate")
        label3.fontSize = 50
        label3.position = CGPoint(x: self.frame.midX, y: 200)
        label3.name = "third"
        
        // 4位の表示使う
        let label4 = SKLabelNode(fontNamed: "Copperplate")
        label4.fontSize = 50
        label4.position = CGPoint(x: self.frame.midX, y: 100)
        label4.name = "four"
        
        // 5位の表示使う
        let label5 = SKLabelNode(fontNamed: "Copperplate")
        label5.fontSize = 50
        label5.position = CGPoint(x: self.frame.midX, y: 0)
        label5.name = "five"
        
        
        
        
        
        //firebase
        ref = Database.database().reference()
        //データが欲しい childAdded
        ref.child("data").observe(.value , with: { (snapshot: DataSnapshot) in
            
            //JSON形式でもらいたい　オートIDから
            let getjson = JSON(snapshot.value as? [String : AnyObject] ?? [:])
            
            //データが0件の場合何もしない
            if getjson.count == 0 { return }
            
            //firebaseのデータベースにアクセス。大きさ順に並べる
            for (key, val) in getjson.dictionaryValue {

              if(getjson[key]["number"].stringValue.i! >= self.number1){
                    print("ranking1ok")
                
                    self.number5 = self.number4
                    self.number4 = self.number3
                    self.number3 = self.number2
                    self.number2 = self.number1
                    self.number1 = getjson[key]["number"].stringValue.i!
                    print(self.number1,"self.number1")
                    
                }
                else if( getjson[key]["number"].stringValue.i! < self.number1 && getjson[key]["number"].stringValue.i! >= self.number2){
               
                    self.number5 = self.number4
                    self.number4 = self.number3
                    self.number3 = self.number2
                    self.number2 = getjson[key]["number"].stringValue.i!

                }
                else if(getjson[key]["number"].stringValue.i! < self.number2 && getjson[key]["number"].stringValue.i! >= self.number3){
                
                    self.number5 = self.number4
                    self.number4 = self.number3
                    self.number3 = getjson[key]["number"].stringValue.i!
                    
                }
                else if(getjson[key]["number"].stringValue.i! < self.number3 && getjson[key]["number"].stringValue.i! >= self.number4){
                
                    self.number5 = self.number4
                    self.number4 = getjson[key]["number"].stringValue.i!
                    
                }
                else if(getjson[key]["number"].stringValue.i! < self.number4 && getjson[key]["number"].stringValue.i! >= self.number5){
                
                    self.number5 = getjson[key]["number"].stringValue.i!
                    
                }
            
            }
            
            })
        
         //ソート後textに代入
       DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        
    
        label1.text = "1位" + "    " + String(self.number1)
        
        print(String(self.number1),"String(self.number1)")
        
        label2.text = "2位" + "    " + String(self.number2)
        label3.text = "3位" + "    " + String(self.number3)
        label4.text = "4位" + "    " + String(self.number4)
        label5.text = "5位" + "    " + String(self.number5)
        
        //labelをadd
        self.addChild(label1)
        self.addChild(label2)
        self.addChild(label3)
        self.addChild(label4)
        self.addChild(label5)
        self.addChild(startLabel)
        }
        }

    // 「Start」ラベルをタップしたら、GameSceneへ遷移させる。
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touchedNode = SKNode()
        print("TouchBeganOk")
        //押したnodeをfor文の中で特定する
        for touch in touches {
            let location = touch.location(in: self)
            touchedNode = self.atPoint(location)
        }
        
        if (touchedNode.name != nil) {
            if touchedNode.name == "StartBack" {
                let newScene = GameScene(fileNamed: "StartGameScene")
                newScene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(newScene)
            }
        }
    }
}
