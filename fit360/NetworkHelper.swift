import Foundation

class NetworkHelper {
    
    // create a URL from parameters
    public func URLFromParameters(_ parameters: [String:String], withPathExtension: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = Network.ApiScheme
        components.host = Network.ApiHost
//        components.path = Network. + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> NetworkHelper {
        struct Singleton {
            static var sharedInstance = NetworkHelper()
        }
        return Singleton.sharedInstance
    }
    
}
