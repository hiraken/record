//
//  _07ViewController.h
//  Record
//
//  Created by KENJIRO HIRAMATSU on 12/04/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface _07ViewController : UIViewController  <AVAudioRecorderDelegate> {
    
    //AVAudioRecorder *recorder;
    AVAudioRecorder *myRecorder;
    NSURL *recordingURL;
    NSURL *url;
    bool *sw;

    IBOutlet UIButton *b1;
    IBOutlet UIButton *b2;
    IBOutlet UIButton *b3;

}

- (IBAction)buttonClicked:(id)sender;
- (IBAction)buttonClicked2:(id)sender;
- (IBAction)buttonClicked3:(id)sender;

@end

