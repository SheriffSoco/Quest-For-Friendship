//
//  backpackInventory.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 4/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class BackpackInventory : CCNode {
    
    var menuButton = 0
    
    func exit() {
        self.visible = false
        menuButton = 0
    }
}