//
//  FirstViewController.swift
//  Chat
//
//  Created by Владислав Цветков on 26/01/2019.
//  Copyright © 2019 Владислав Цветков. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray
            self.tableView.reloadData()
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell else  {return UITableViewCell()}
        
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        cell.configureCell(profileImage: image!, email: message.senderId, content: message.content)
        
        return cell
    }
    
    
}
