//
//  ViewController.swift
//  facebookLoginDemo
//
//  Created by 王富生 on 2017/1/11.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit
import Firebase
import Social

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = URL(string: "https://developers.facebook.com/")
        
        let loginButton = FBSDKLoginButton()
        let shareButton = UIButton()
        let shareButton2 = FBSDKShareButton()
        let likeButton = FBSDKLikeControl()
        let sendButton = FBSDKSendButton()
        
        view.addSubview(loginButton)
        view.addSubview(shareButton)
        view.addSubview(shareButton2)
        view.addSubview(likeButton)
        view.addSubview(sendButton)
        
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
        
        shareButton.frame = CGRect(x: 16, y: 112, width: view.frame.width - 32, height: 50)
        shareButton.backgroundColor = UIColor.blue
        shareButton.setTitle("Share", for: .normal)
        shareButton.addTarget(self, action: #selector(ViewController.share), for: .touchUpInside)
        
        shareButton2.frame = CGRect(x: 16, y: 174, width: view.frame.width - 32, height: 50)
        shareButton2.shareContent = content
        
        likeButton.frame = CGRect(x: 16, y: 236, width: view.frame.width - 32, height: 50)
        likeButton.likeControlStyle = FBSDKLikeControlStyle.standard
        likeButton.likeControlHorizontalAlignment = FBSDKLikeControlHorizontalAlignment.center
        likeButton.objectID = "https://www.facebook.com/UniversalTaiwan/?hc_ref=ADS&fref=nf&ft[tn]=kC&ft[qid]=6376121934726721696&ft[mf_story_key]=8072913200832169744&ft[ei]=AI%40413d34776ffc8b8bac478ff9e2809a18&ft[top_level_post_id]=10154283568016947&ft[fbfeed_location]=1&ft[insertion_position]=1&__md__=1"
        
        sendButton.frame = CGRect(x: 16, y: 298, width: view.frame.width - 32, height: 50)
        sendButton.shareContent = content
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Log out")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print("Login error", error)
            return
        }
        showEamilAddress()
    }
    
    
    func showEamilAddress() {
        let accessToken = FBSDKAccessToken.current()
        
        guard let accessTokenString = accessToken?.tokenString else {
            return
        }
        print("accessToken", accessTokenString)
        
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                print("something wrong woth FB user :", error!)
                return
            }
            print("Successfully login", user ?? "")
        })
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in
            if err != nil {
                print("error", err!)
                return
            }
            
            print("result is ", result ?? "")
            print("connection is ", connection ?? "nothing")
        }
        print("Login successfully")
    }
    
    func share() {
        
        let  content = URL(string: "https://developers.facebook.com/")
        //        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
        let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookSheet.setInitialText("Share on Facebook")
        facebookSheet.add(content)
        self.present(facebookSheet, animated: true, completion: nil)
        //        } else {
        //            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
        //            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        //            self.present(alert, animated: true, completion: nil)
        //        }
    }
}

