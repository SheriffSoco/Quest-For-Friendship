import Foundation

class MainScene: CCNode {
    var movementSpeed : CGFloat = 2
    var connor : CCSprite!
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        
    }
    
    override func touchBegan(touch: CCTouch!, withEvent: CCTouchEvent!) {
        var location = touch.locationInNode(self)
        
        if location.x < 284 {
            connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
            println(connor.position.x)
        }
        else {
            connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
            println(connor.position.x)
        }
    }

}
