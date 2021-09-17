//
//  CryptoViewController.swift
//  Bitcoin
//
//  Created by Zain Cheema on 9/15/21.
//

import UIKit

class CryptoViewController: UIViewController {
    
    
    @IBOutlet weak var getPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
      
            let _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.moveToNextView), userInfo: nil, repeats: true)

        }
    }
@objc func moveToNextView() -> Void{
    perfoumURLRequest(urLString:"https://api.nomics.com/v1/currencies/ticker?key=a47159aa50954900e6aa9fbc9ad0a2e8015da9a7&ids=BTC&interval=1d,5sec&convert=USD&per-page=1" )
    
}

        func perfoumURLRequest(urLString: String){
            if let url = URL(string: urLString){
              let browser = URLSession(configuration: .default)
              let search = browser.dataTask(with: url){ (data, response, error) in
                if (error != nil){
                  print("search error")
                  print(error!)
                }
                
                
                if let safeData = data{
                  print("data received")
                  let decoder = JSONDecoder()
                  do{
                    let decodedata = try decoder.decode([DataModel].self, from:safeData)
        
        
                    DispatchQueue.main.async {
                      for i in decodedata{
                        self.getPrice.text = i.price
                      }
                    }
        
                  }catch{
                    print("decode error")
                    print(error)
                  }
                }
              }
              search.resume()
         }
     }
}
