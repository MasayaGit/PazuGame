//
//  StartGameScene.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/26.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StartGameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        // タイトルを表示。
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "パズルゲーム";
        myLabel.fontSize = 80;
        myLabel.position = CGPoint(x:self.frame.midX, y:200);
        self.addChild(myLabel)
        
        // 「Start」を表示。
        let startLabel = SKLabelNode(fontNamed: "Copperplate")
        startLabel.text = "START"
        startLabel.fontSize = 50
        startLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        startLabel.name = "Start"
        self.addChild(startLabel)
        
        
        // ランキングに移動するボタンを表示。
        let ranking = SKLabelNode(fontNamed: "Copperplate")
        ranking.text = "ランキングへ"
        ranking.fontSize = 50
        ranking.position = CGPoint(x: self.frame.midX, y: -200)
        ranking.name = "ranking"
        self.addChild(ranking)
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
            //start
            if touchedNode.name == "Start" {
                let newScene = GameScene(fileNamed: "GameScene")
                newScene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(newScene)
            }
            //ランキング
            if touchedNode.name == "ranking" {
                let newScene = GameScene(fileNamed: "RankingGameScene")
                newScene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(newScene)
            }

        }
    }
}
