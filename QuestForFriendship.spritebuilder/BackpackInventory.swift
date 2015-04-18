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
    
    func exit() {
        self.visible = false
        menuButton = 0
    }
    
    func open() {
        self.visible = true
        menuButton = 1
    }
    
}