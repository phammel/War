//
//  hearts.swift
//  War
//
//  Created by Phammel on 12/8/15.
//  Copyright © 2015 Phammel. All rights reserved.
//

import Foundation
import UIKit

class Card
{
    var display: String
    var val: Int
    var image: String
    
    
    
    init(worth: Int, suit: Int)
    {
        
        val = worth
        //============
        if( suit == 1)
        {
           image = "suits1real"
        }else if suit == 2
        {
            image = "suit2"
        }else if suit == 3
        {
            image = "suits3"
        }else if suit == 4
        {
            image = "suits4"
        }else
        {
            image = ""
        }
        //==============
       if (worth > 1 && worth < 11)
       {
            display = "\(worth)"
        }
        else if worth == 11
       {
        display = "J"
        }
        else if worth == 12
       {
        display = "Q"
        }
        else if worth == 13
       {
        display = "K"
        }
        else if worth == 1
       {
            display = "A"
        }
        else
       {
        display = ""
        }
       //============
        
    }
    
}
