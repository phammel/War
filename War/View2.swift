//
//  View2.swift
//  War
//
//  Created by Phammel on 12/8/15.
//  Copyright © 2015 Phammel. All rights reserved.
//

import Foundation
import UIKit
class View2: UIViewController {
   //-----outlets------------------------------------------
    @IBOutlet weak var topcardnum1: UILabel!
    @IBOutlet weak var topcardnum2: UILabel!
    @IBOutlet weak var topcardpic: UIImageView!
    @IBOutlet weak var topdeckcount: UILabel!
    @IBOutlet weak var botcardnum1: UILabel!
    @IBOutlet weak var botcardnum2: UILabel!
    @IBOutlet weak var botcardpic: UIImageView!
    @IBOutlet weak var botdeckcount: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cardsinplay: UILabel!
    
    
    @IBOutlet weak var warlabel2: UILabel!
    @IBOutlet weak var gobackbutton: UIButton!
    
  //------------------------------------------
   //----------vars-------------
    var cards = [Card]()
    var deck1 = [Card]()
    var deck2 = [Card]()
    var cardsCopy1 = [Card]()
    var cardsCopy2 = [Card]()
    var pos = 0
    var inplay = [Card]()
    var points1 = 0
    var points2 = 0
    var namestring = ""
   //--------------------------------
    
//------------view---------------------
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        
        
        //make deck of card
        for (var s = 1; s <= 4; s++)
        {
            for (var i = 1; i <= 13; i++)
            {
                cards.append(Card(worth: i, suit: s))
            }// for var i
       }//for var s
    
        
   //make two copys
    cardsCopy1 = cards
    cardsCopy2 = cards
    twodecks1()
    twodecks2()
       
        name.text = namestring
        
        
    }//view did
//-------make a random deck----------------------------------
    func twodecks1()
    {
        
        for (var count1 = 0; count1 < 25; count1++)
        {
            let randomcard = Int(arc4random_uniform(UInt32(cardsCopy1.count)))
            deck1.append(cardsCopy1[randomcard])
            cardsCopy1.removeAtIndex(randomcard)
            
        }
//-----------------------------------------
//--------make a random deck2--------------------------------
    }//twodecks1
    
        func twodecks2()
        {
            let randomcard = Int(arc4random_uniform(UInt32(cardsCopy2.count)))
            for (var count1 = 0; count1 < 25; count1++)
            {
                let randomcard = Int(arc4random_uniform(UInt32(cardsCopy2.count)))
                deck2.append(cardsCopy2[randomcard])
                cardsCopy2.removeAtIndex(randomcard)
                
            }
        }//twodeck2
//-----------------------------------------------------
//----------alert function--------------------------------
    func checkforwin()
    {
        
        
        //if you win
        if ((deck1.count == 0 || deck2.count == 0 ) && (points1 < points2))
        {
            let alert = UIAlertController(title: "you win", message: "You Won the game", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            let resetbutton = UIAlertAction(title: "menu", style: UIAlertActionStyle.Default, handler: {sender in
                //go back to home 
                self.performSegueWithIdentifier("back", sender: self.gobackbutton)
                
            })
            alert.addAction(resetbutton)
            presentViewController(alert, animated: true, completion: nil)
            }//if
       
        
        //if you loose
        if ((deck1.count == 0 || deck2.count == 0 ) && (points1 > points2))
        {
            let alert = UIAlertController(title: "you lose", message: "You Lost the game", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            let resetbutton = UIAlertAction(title: "menu", style: UIAlertActionStyle.Default, handler: {sender in
                //go back to homescreen
                self.performSegueWithIdentifier("back", sender: self.gobackbutton)
            })
            alert.addAction(resetbutton)
            presentViewController(alert, animated: true, completion: nil)
        }//if
    }//check if won
//-------------------------------------------------
//----------tie------------------
    func tie()
    {
        //add three cards
        if(deck1.count > 3 && deck2.count > 3)
        {
        inplay.append(deck1[1])
        inplay.append(deck1[2])
        inplay.append(deck1[3])
        
        inplay.append(deck2[1])
        inplay.append(deck2[2])
        inplay.append(deck2[3])
        cardsinplay.text = "\(inplay.count)"
        
       
        //see who won
        if(deck1[3].val > deck2[3].val)
        {
            points1 += inplay.count
            cardsinplay.text = "\(inplay.count)"
            
        }
        else if(deck2[3].val > deck1[3].val)
        {
            points2 += inplay.count
            cardsinplay.text = "\(inplay.count)"
        }
        }
        else
        {
            warlabel2.text = "WAR"
            points1++
            points2++
            
        }
        
    }//tie
//-------------------------------
   
 //-------------------------when tapped----------
    @IBAction func Tapped(sender: UITapGestureRecognizer)
    {   //make sure cards left
        if( deck1.count != 0 && deck2.count != 0 )
        {
        //set cards
        warlabel2.text = ""
        inplay.removeAll()
        checkforwin()
        topcardpic.image = UIImage(named: deck1[0].image)
        topcardnum1.text = deck1[0].display
        topcardnum2.text = deck1[0].display
        topdeckcount.text = "\(points1)"
        inplay.append(deck1[0])
        
        
        botcardpic.image = UIImage(named: deck2[0].image)
        botcardnum1.text = deck2[0].display
        botcardnum2.text = deck2[0].display
        botdeckcount.text = "\(points2)"
        inplay.append(deck2[0])
            
            
            
            
        
        //see who won
       if(deck1[0].val > deck2[0].val)
        {
            points1 += inplay.count
            cardsinplay.text = "\(inplay.count)"
            
        }
        else if(deck2[0].val > deck1[0].val)
        {
            points2 += inplay.count
             cardsinplay.text = "\(inplay.count)"
            
        }
        // tie
       else if (deck1[0].val == deck2[0].val)
       {
        
        
        
        
            warlabel2.text = "WAR"
            print("test")
            tie()
            cardsinplay.text = "\(inplay.count)"
        
        
    
        }
            
            
        deck1.removeAtIndex(0)
        deck2.removeAtIndex(0)
            
            
        }
            
            
        else // if zero
        {
            checkforwin()
        }
        
        
     }//tapped
  //--------------------------------------------
    //test
    
    
    
    
    
    
    
    
    
    
    
    
    
}//class

