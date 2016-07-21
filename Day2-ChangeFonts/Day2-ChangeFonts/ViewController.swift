//
//  ViewController.swift
//  Day2-ChangeFonts
//
//  Created by luyang on 7/17/16.
//  Copyright © 2016 lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var changeBtn: UIButton!

    @IBOutlet weak var tableView: UITableView!

    var data = ["Once, when I was six years old", "I read a book about the primeval forest", "The book said", "Boa constrictors swallow thir prey whole", "withiout chewing it", "I pondered this deeply", "And then, I made my first drawing", "I showed my masterpiece to grown-ups", "and asked if the drawing frightened them", "Frightened?", "Why should anyone be frightened of a hat", "Grown-ups", "They never understand by themselves"]

    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]

    var fontRowIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeFont(sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1)%3
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        cell.textLabel?.textAlignment = .Center

        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
}

