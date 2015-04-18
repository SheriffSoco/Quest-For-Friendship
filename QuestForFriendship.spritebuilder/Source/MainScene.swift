import Foundation

class MainScene: CCNode {
    var movementSpeed : CGFloat = 3
    var movement : CGFloat = 0 //init movement
    var scroll : Bool = false //init walls
    var camera : CCNode!
    var connor : CCSprite!
    var dock1 : CCSprite!
    var dock2 : CCSprite!
    var docks : [CCSprite] = []
    var friendsButton : CCButton!
    var backpackButton : CCButton!
    var settingsButton : CCButton!
    var friendsScreen : FriendsInventory!
    var backpackScreen : BackpackInventory!
    var menuSwitch : CGFloat = 0
    
    var insideHouseOne : CCSprite!
    var doorOne : CCButton!
    var insideDoorOne : CCButton!
    
    var insideHouseTwo : CCSprite!
    var doorTwo : CCButton!
    var insideDoorTwo : CCButton!
    
    var insideHouseThree : CCSprite!
    var doorThree : CCButton!
    var insideDoorThree : CCButton!
    
    var friends : [Friend] = []
    var sebastianChant : Friend!
    
    var items : [Item] = []
    var oar : Item!
    
    var oarIcon : CCSprite!
    
    /*
    var insideHouseFour : CCSprite!
    var doorFour : CCButton!
    var insideDoorFour : CCButton!
    
    var insideHouseFive : CCSprite!
    var doorFive : CCButton!
    var insideDoorFive : CCButton!
    */
    
    func didLoadFromCCB() {
        docks.append(dock1)
        docks.append(dock2)
        friends.append(sebastianChant)
        items.append(oar)
        self.userInteractionEnabled = true
        sebastianChant.itemWanted = 1
        oar.id = 1
    }
    
    override func update(delta: CCTime) {
        for friend in friends {
            if friend.checkForItem == true {
                if backpackScreen.hasOar == true {
                    backpackScreen.give()
                    friendsScreen.fullHead()
                    oarIcon.visible = false
                }
                else {
                    friendsScreen.halfHead()
                    oarIcon.visible = true
                }
                friend.checkForItem = false
            }
        }
        for item in items {
            if item.grabbed == true && item.alreadyGrabbed == false {
                backpackScreen.grabItem(item.id)
                item.alreadyGrabbed = true
            }
        }
        if friendsScreen.menuButton == 0 && backpackScreen.menuButton == 0 {
            if movement == -1 {
                connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
                connor.flipX = true
                if connor.animationManager.runningSequenceName == "Standstill" {
                    connor.animationManager.runAnimationsForSequenceNamed("Running")
                }
                if connor.position.x + camera.position.x < 100 {
                    if scroll == false {
                        camera.position = ccp(camera.position.x + movementSpeed, camera.position.y)
                    }
                    else {
                        if connor.position.x + camera.position.x < 0 {
                            connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
                        }
                    }
                }
            }
            else if movement == 1 {
                connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
                connor.flipX = false
                if connor.animationManager.runningSequenceName == "Standstill" {
                    connor.animationManager.runAnimationsForSequenceNamed("Running")
                }
                if connor.position.x + camera.position.x > 468 {
                    if scroll == false {
                        camera.position = ccp(camera.position.x - movementSpeed, camera.position.y)
                    }
                    else {
                        if connor.position.x + camera.position.x > 504 {
                            connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
                        }
                    }
                }
            }
        }
        
        
        //to move dock sprites
        for dock in docks {
            let dockWorldPosition = camera.convertToWorldSpace(dock.position)
            let dockScreenPosition = self.convertToNodeSpace(dockWorldPosition)
            if dockScreenPosition.x <= (-dock.contentSize.width) {
                dock.position = ccp(dock.position.x + dock.contentSize.width * 2, dock.position.y)
            }
            else if dockScreenPosition.x >= (dock.contentSize.width) {
                dock.position = ccp(dock.position.x - dock.contentSize.width * 2, dock.position.y)
            }
        }
    }
    
    override func touchBegan(touch: CCTouch!, withEvent: CCTouchEvent!) {
        var location = touch.locationInNode(camera)
        
        if friendsScreen.menuButton == 0 {
            //for movement
            if location.x < connor.position.x {
                movement = -1
            }
            else {
                movement = 1
            }
        }
    }

    override func touchEnded(touch: CCTouch!, withEvent: CCTouchEvent!) {
        var location = touch.locationInNode(camera)
        movement = 0
        connor.animationManager.runAnimationsForSequenceNamed("Standstill")
    }
    
    func friendmenu() {
        friendsScreen.open()
    }
    
    func backpackmenu() {
        backpackScreen.open()
    }
    
    func houseOneEnter() {
        camera.position = ccp(-insideHouseOne.position.x, -insideHouseOne.position.y)
        connor.position = ccp(insideDoorOne.position.x, insideDoorOne.position.y)
        scroll = true
    }
    func houseOneExit() {
        camera.position = ccp(-doorOne.position.x + 60, -doorOne.position.y + 103)
        connor.position = ccp(doorOne.position.x, doorOne.position.y - 11.5)
        scroll = false
    }
    
    func houseTwoEnter() {
        camera.position = ccp(-insideHouseTwo.position.x, -insideHouseTwo.position.y)
        connor.position = ccp(insideDoorTwo.position.x, insideDoorTwo.position.y)
        scroll = true
    }
    func houseTwoExit() {
        camera.position = ccp(-doorTwo.position.x + 60, -doorTwo.position.y + 103)
        connor.position = ccp(doorTwo.position.x, doorTwo.position.y - 11.5)
        scroll = false
    }
    
    func houseThreeEnter() {
        camera.position = ccp(-insideHouseThree.position.x, -insideHouseThree.position.y)
        connor.position = ccp(insideDoorThree.position.x, insideDoorThree.position.y)
        scroll = true
    }
    func houseThreeExit() {
        camera.position = ccp(-doorThree.position.x + 60, -doorThree.position.y + 103)
        connor.position = ccp(doorThree.position.x, doorThree.position.y - 11.5)
        scroll = false
    }
    
    /*
    func houseFourEnter() {
        camera.position = ccp(-insideHouseFour.position.x, -insideHouseFour.position.y)
        connor.position = ccp(insideDoorFour.position.x, insideDoorFour.position.y)
        scroll = true
    }
    func houseFourExit() {
        camera.position = ccp(-doorFour.position.x + 60, -doorFour.position.y + 103)
        connor.position = ccp(doorFour.position.x, doorFour.position.y - 11.5)
        scroll = false
    }
    
    func houseFiveEnter() {
        camera.position = ccp(-insideHouseFive.position.x, -insideHouseFive.position.y)
        connor.position = ccp(insideDoorFive.position.x, insideDoorFive.position.y)
        scroll = true
    }
    func houseFiveExit() {
        camera.position = ccp(-doorFive.position.x + 60, -doorFive.position.y + 103)
        connor.position = ccp(doorFive.position.x, doorFive.position.y - 11.5)
        scroll = false
    }
    */

}
