//
//  BackpackInventory.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 4/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class BackpackInventory : CCNode {
    
    var menuButton = 0
    var hasOar = false
    var backpackList : [Int] = []
    var oneButton : CCButton!
    var twoButton : CCButton!
    var threeButton : CCButton!
    var fourButton : CCButton!
    var fiveButton : CCButton!
    var sixButton : CCButton!
    var sevenButton : CCButton!
    var eightButton : CCButton!
    var nineButton : CCButton!
    var tenButton : CCButton!
    var elevenButton : CCButton!
    var twelveButton : CCButton!
    var oarButton : CCButton!
    
    func exit() {
        self.visible = false
        menuButton = 0
    }
    
    func open() {
        self.visible = true
        menuButton = 1
    }
    
    func grabItem(thing: Int) {
        backpackList.append(thing)
        oarButton.position = ccp(oneButton.position.x, oneButton.position.y)
        oarButton.visible = true
        hasOar = true
    }
    
    func updateScreen() {
    }
    
    func give() {
        hasOar = false
        oarButton.visible = false
    }
    
}