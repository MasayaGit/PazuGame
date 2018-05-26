//
//  TamaInformation.swift
//  Pazudora
//
//  Created by 鈴木　雅也 on 2018/03/21.
//  Copyright © 2018年 masamon. All rights reserved.
//

import Foundation
class TamaInformation{
    
    var piaces:[[Tama]]
    
    init(piaces:[[Tama]]){
        
        self.piaces = piaces
    }
    func printInfo(){
        /*
         玉の情報の出力
         */
        for i in 0..<Board.size{
            for j in 0..<Board.size{
                print(piaces[i][j].sprite.color)
              //  print(piaces[i][j].num)
                if(j == Board.size-1){
                    print("改行")
                }
            }
        }
    }
    
}
