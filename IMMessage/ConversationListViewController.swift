//
//  ConversationListViewController.swift
//  IMMessage
//
//  Created by ZhongMing on 23/10/16.
//  Copyright © 2016 ZhongMing. All rights reserved.
//

import UIKit
import KxMenu

class ConversationListViewController: RCConversationListViewController {

    
    @IBAction func openMenu(_ sender: AnyObject) {
        var frame1 = accessibilityFrame.origin
        frame1.y = frame1.y + 30
        let frame = CGRect.init(x: 60, y: 50, width: 470, height: 15)
        
        //frame = frame + 30
        
        KxMenu.show(in: self.view, from: frame, menuItems: [KxMenuItem("Customer Service", image: nil, target: self, action: "Menu1"),
            KxMenuItem("Add Contacts", image: nil, target: self, action: "Menu1")
            ])
    }
    
    func Menu1() -> Void {
        print("Hello world")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        appDelegate?.connectServer (completion: {()-> Void in
            //self.title = "Successfully connected"
            self.setDisplayConversationTypes([
                
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue
                
                ])
            
            self.refreshConversationTableViewIfNeeded()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        let vc = RCConversationViewController()
        vc.userName = model.conversationTitle
        vc.targetId = model.targetId
        vc.conversationType = RCConversationType.ConversationType_PRIVATE
        
        self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        self.tabBarController?.tabBar.isHidden = true
    }
 

}
