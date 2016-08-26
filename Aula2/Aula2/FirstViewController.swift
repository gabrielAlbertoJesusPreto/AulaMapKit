//
//  FirstViewController.swift
//  Aula2
//
//  Created by Gabriel Alberto de Jesus Preto on 25/08/16.
//  Copyright © 2016 MackMobile. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var messageText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.messageText.resignFirstResponder()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToSecond" {
            let viewController = segue.destinationViewController as! SecondViewController
            viewController.message = messageText.text
        }
    }
 
}
