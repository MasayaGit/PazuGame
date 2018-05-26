//
//  FinishGameScene.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/26.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import Firebase
import FirebaseAuth

class FinishGameScene : SKScene {
    
    
    //Firebase
    var ref:DatabaseReference!
    
    override func didMove(to view: SKView) {
        
        //firebase
        ref = Database.database().reference()
        let firebaseCountString = String(GameScene.syokyoTamaCount)
        //childByAutoIdはランダムな文字列でIDを付与してくれる。
        self.ref.child("data").childByAutoId().setValue(["number": firebaseCountString ])
        //self.ref.child("data").childByAutoId().updateChildValues(["number": firebaseCountString ])
        
        
        // 「Start」を表示。
        let startLabel = SKLabelNode(fontNamed: "Copperplate")
        startLabel.text = "戻る"
        startLabel.fontSize = 50
        startLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        startLabel.name = "StartBack"
        self.addChild(startLabel)
        
        let countString = String(GameScene.syokyoTamaCount)
        GameScene.syokyoTamaCount = 0
        let countLabel = SKLabelNode(fontNamed: "Copperplate")
        countLabel.text = countString
        countLabel.fontSize = 50
        countLabel.position = CGPoint(x: self.frame.midX, y: 500)
        self.addChild(countLabel)
        
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
