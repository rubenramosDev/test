
import UIKit

class NetworkManager {
    

    static let shared = NetworkManager()

    let cache = NSCache<NSString, UIImage>()
    
   
    private init() {}
    
    
    func getClient(completed : @escaping (Result<[Client], GeneralExceptions>) -> Void) {
    
        let endpoint = "192.168.43.153/projects/LP/iOS/api_resto/api/client/read.php"
        
        guard let url = URL(string : endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let _ = error {
            completed(.failure(.unableToComplete))
            return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completed(.failure(.invalidResponse))
            return
        }
        
        guard let data = data else {
            completed(.failure(.invalidData))
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let client = try decoder.decode([Client].self, from: data)
            completed(.success(client))
        }catch{
            completed(.failure(.invalidData))
        }
    }
        task.resume();
        return
    }
    
    
    func getDishes(completed : @escaping (Result<[Dish], GeneralExceptions>) -> Void) {
    
        let endpoint = "http://192.168.43.153/projects/LP/iOS/api_resto/api/dish/read.php"
        
        guard let url = URL(string : endpoint) else {
            completed(.failure(.unableToComplete))
            print("1")
            return
        }
        
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let _ = error {
            completed(.failure(.unableToComplete))
            print("2")
            return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completed(.failure(.invalidResponse))
            print("3")
            return
        }
        
        guard let data = data else {
            completed(.failure(.invalidData))
            print("4")
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let dishes = try decoder.decode([Dish].self, from: data)
            completed(.success(dishes))
        }catch{
            print("5")
            completed(.failure(.invalidData))
        }
    }
        task.resume();
        return
    }
    
    
}


