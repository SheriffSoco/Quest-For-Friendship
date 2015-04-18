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
    var cancelButton : CCButton!
    var one: CCButton!
    var two : CCButton!
    var three : CCButton!
    var four : CCButton!
    var five : CCButton!
    var six : CCButton!
    var seven : CCButton!
    var eight : CCButton!
    var nine : CCButton!
    var ten : CCButton!
    var eleven : CCButton!
    var twelve : CCButton!
    
    func cancel() {
        self.visible = false
        menuButton = 0
    }
}