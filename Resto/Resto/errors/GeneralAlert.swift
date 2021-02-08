import UIKit
 
 class GeneralAlert{
   
    let title : String
    let message : String
    
    init(title: String, message : String) {
        self.title = title
        self.message = message
    }
    
    func showAlert(on vc : UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
 }
