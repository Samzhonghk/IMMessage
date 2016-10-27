//
//  ConversationViewController.swift
//  IMMessage
//
//  Created by ZhongMing on 10/10/16.
//  Copyright © 2016 ZhongMing. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        // Do any additional setup after loading the view.
        
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)
        //let currentUser = RCIMClient.shared().currentUserInfo
        //self.targetId = currentUser?.userId
        //self.targetId = RCIMClient.shared().currentUserInfo.userId!
        //self.userName = RCIMClient.shared().currentUserInfo.name
        //self.userName = currentUser?.name
        
        //self.title = self.userName
        
        
        self.targetId = "Tianna"
        self.userName = "sam"
        self.title = "Sam Zhong"
        
        
        self.conversationType = .ConversationType_PRIVATE
        
        //self.title = userName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
