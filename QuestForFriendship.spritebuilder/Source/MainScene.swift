import Foundation

class MainScene: CCNode {
    var movementSpeed : CGFloat = 2
    var movement : CGFloat = 0
    var connor : CCSprite!
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if movement == -1 {
            connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
            connor.flipX = true
        }
        else if movement == 1 {
            connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
            connor.flipX = false
        }
    }
    
    override func touchBegan(touch: CCTouch!, withEvent: CCTouchEvent!) {
        var location = touch.locationInNode(self)
        
        if location.x < 284 {
            movement = -1
        }
        else {
            movement = 1
        }
    }

    override func touchEnded(touch: CCTouch!, withEvent: CCTouchEvent!) {
        movement = 0
    }

}
