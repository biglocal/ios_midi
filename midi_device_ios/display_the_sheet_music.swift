//
//  display_the_sheet_music.swift
//  midi_device_ios
//
//  Created by Yu-An on 2017/7/17.
//  Copyright © 2017年 Yu-An. All rights reserved.
//

import UIKit

class display_the_sheet_music: UIViewController {
    let midi_dev = core_midi_event()
    @IBOutlet weak var test_notification: UILabel!
    var i = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        midi_dev.midi_init()
        NotificationCenter.default.addObserver(self, selector: #selector(display_the_sheet_music.listener), name: NOTIFICATION_NAME, object: nil)
        // Do any additional setup after loading the view.
        test_notification.text = "TT"
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        log(str:"")
        // Dispose of any resources that can be recreated.
    }
    
    func listener(notification:Notification) -> Void
    {
        log(str:"thread:\(Thread.current)")
        
        DispatchQueue.main.sync {
            log(str:"thread:\(Thread.current)")
            test_notification.text = String(globalInfo.note.index)
        }
        i += 1
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
