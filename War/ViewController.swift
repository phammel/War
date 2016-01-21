//
//  ViewController.swift
//  War
//
//  Created by Phammel on 12/8/15.
//  Copyright © 2015 Phammel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var entername: UITextField!
       
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nextVC = segue.destinationViewController as! View2
            nextVC.namestring = entername.text!
            
        
    }

    
    
    
    
    
    
    
    
    

   

}

