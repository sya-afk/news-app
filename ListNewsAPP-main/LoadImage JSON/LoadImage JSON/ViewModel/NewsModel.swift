//
//  NewsModel.swift
//  LoadImage JSON
//
//  Created by MacBook on 08/02/21.
//

import Foundation
import Combine
import SwiftyJSON

class NewsModel : ObservableObject {
    @Published var data = [News]()
    
    init() {
        
        let url = "http://newsapi.org/v2/top-headlines?country=id&category=technology&apiKey=64b7fc282f0d4b35a4d68cec1c0302dc"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            let items = json["articels"].array!
            
            for i in items {
                
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let imurl = i["urlToimage"].stringValue
                
                DispatchQueue.main.async{
                    self.data.append(News(title: title, description: description, image: imurl))
                }
            }
        }.resume()
    }
}
