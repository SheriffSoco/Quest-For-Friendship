//
//  Item.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 4/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Item : CCSprite {
    
    var id = 0
    var grabbed = false
    var alreadyGrabbed = false
    
    func grab() {
        self.visible = false
        grabbed = true
    }
}