//
//  _07ViewController.m
//  Record
//
//  Created by KENJIRO HIRAMATSU on 12/04/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "_07ViewController.h"


@implementation _07ViewController

- (IBAction)buttonClicked:(id)sender {
    
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,YES);
    NSString *documentDir = [filePaths objectAtIndex:0];    
    NSString *path = [documentDir stringByAppendingPathComponent:@"recording.caf"];
    recordingURL = [NSURL fileURLWithPath:path];
    
    // 録音設定
    NSDictionary *settings;
    settings = [NSDictionary dictionaryWithObjectsAndKeys:
                [NSNumber numberWithUnsignedInt:kAudioFormatLinearPCM], AVFormatIDKey,
                [NSNumber numberWithInt:1], AVNumberOfChannelsKey,
                nil];
    
    // インスタンス生成
    NSError *error = nil;
    myRecorder = [[AVAudioRecorder alloc]initWithURL:recordingURL
                                            settings:settings 
                                            error:&error];
    
     if(error){
     NSLog(@"error = %@",error);
     return;
     }
     
    
/*
     b1 = nil;
     b3 = nil;
     
     // 録音データを保存する場所
     NSString *path = [NSString stringWithFormat:@"%@/test.caf",
     [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
     
     url = [[NSURL alloc] initFileURLWithPath:path];
     // 録音の設定 AVNumberOfChannelsKey チャンネル数1
     NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
     [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
     [NSNumber numberWithInt: kAudioFormatLinearPCM], AVFormatIDKey,
     [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
     [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,
     [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,
     [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,
     nil];
     // インスタンス生成(エラー処理は省略)
     NSError *error = nil;
     recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
     recorder.delegate = self;
     // 録音ファイルの準備(すでにファイルが存在していれば上書きしてくれる)
     [recorder prepareToRecord];
     // 録音中に音量をとるかどうか
     recorder.meteringEnabled = YES;
     
     //sw = FALSE;
 */   
    //recorder.delegate = self;
    myRecorder.delegate = self;     
    //[recorder record];
    [myRecorder record];
        

}

- (IBAction)buttonClicked2:(id)sender {
    /*
    url = recorder.url;
    AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:url
                             
                                                                  error:nil];

    [player play];
     */
    recordingURL = myRecorder.url;
    //recordingURL = recorder.url;
    AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
    //player.delegate = self;
    [player play];
}

- (IBAction)buttonClicked3:(id)sender{
    // 録音終了
    //[recorder stop];
    [myRecorder stop];
    // 録音データの削除。stop メソッドを呼ぶ前に呼んではいけない
    //[myRecorder deleteRecording];
    //[recorder deleteRecording];
}

- (void)viewDidLoad
{
        
}

- (void)viewDidUnload
{
        // 録音ファイルパス
       
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
