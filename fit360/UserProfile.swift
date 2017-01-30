import Foundation

class UserProfile {

    public var userId: String {
        get  {
            // return user id from .plist
            if let path = Bundle.main.path(forResource: "UserProfile", ofType: "plist") {
                if let _userProfile = NSDictionary(contentsOfFile: path) as? [String: Any] {
                    let _userId = _userProfile["userId"] as! String
                    return _userId
                }
            } else {
                // throw exception here userprofile is not found
            }

            return ""
        }
        set(id) { }
    }

    var numberOfDesiredMeals: NSNumber {
        get {
            // return desired number of meals from .plist
            
            if let path = Bundle.main.path(forResource: "UserProfile", ofType: "plist") {
                if let _userProfile = NSDictionary(contentsOfFile: path) as? [String: Any] {
                    let _numberOfDesiredMeals = _userProfile["desiredMeals"] as! NSNumber
                    return _numberOfDesiredMeals
                }
            } else {
                // throw exception here userprofile is not found
            }
            
            let _numberOfDesiredMeals = NSNumber.init()
            return _numberOfDesiredMeals
        }
        set(numberOfDesiredMeals) {
            // set desired number of meals in .plist
        }
    }
    
    func resetNumberOfDesiredMeals() {
        // reset the number of desired meals in the .plist
    }
}
