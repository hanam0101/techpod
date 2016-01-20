//
//  ViewController.swift
//  techpod
//
//  Created by hana on 13/1/2016.
//  Copyright © 2016 hana. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //
    @IBOutlet var table:UITableView!
    
    //
    var songNameArray = [String]()
    //
    var fileNameArray = [String]()
    //
    var imageNameArray = [String]()
    //
    var audioPlayer: AVAudioPlayer!
    
    @IBAction func stop() {
        if audioPlayer.playing == true {
            //
            audioPlayer.stop()
        }
    }
    
    @IBAction func play() {
        if audioPlayer.playing == false {
            //
            audioPlayer.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        table.dataSource = self
        //
        table.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        songNameArray = ["Kanon", "For Elise", "Air on the G String"]
        //
        fileNameArray = ["cannon", "elise", "aria"]
        //
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    //
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        cell.textLabel?.text = songNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell
    }
    //
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@ was selected", songNameArray[indexPath.row])
        
        //
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //
        audioPlayer = try? AVAudioPlayer(contentsOfURL: audioPath)
        
        //
        audioPlayer.play()
    }

}

