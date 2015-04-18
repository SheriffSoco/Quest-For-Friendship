import Foundation

class MainScene: CCNode {
    var movementSpeed : CGFloat = 3
    var movement : CGFloat = 0 //init movement
    var scroll : CGFloat = 0 //init walls
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
    var testHouseDoor : CCButton!
    var insideTestHouseDoor : CCButton!
    
    func didLoadFromCCB() {
        docks.append(dock1)
        docks.append(dock2)
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if friendsScreen.menuButton == 0 || backpackScreen.menuButton == 0 {
            if movement == -1 {
                connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
                connor.flipX = true
                if connor.animationManager.runningSequenceName == "Standstill" {
                    connor.animationManager.runAnimationsForSequenceNamed("Running")
                }
                if connor.position.x + camera.position.x < 100 {
                    if scroll == 0 {
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
                    if scroll == 0 {
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
    
    func menu() {
        friendsScreen.open()
    }
    
    func testEnter() {
        camera.position = ccp(-self.position.x, camera.position.y - 320)
        connor.position = ccp(insideTestHouseDoor.position.x, insideTestHouseDoor.position.y)
        scroll = 1
    }
    func testExit() {
        camera.position = ccp(-self.position.x, camera.position.y + 320)
        connor.position = ccp(testHouseDoor.position.x, testHouseDoor.position.y)
        scroll = 0
    }

}
