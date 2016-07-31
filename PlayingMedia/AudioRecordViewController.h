//
//  AudioRecordViewController.h
//  PlayingMedia
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioRecordViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;

- (IBAction)changeOptions:(id)sender;

@property AVAudioRecorder *recorder;
@property AVAudioPlayer *player;

@property NSString *filePath;



@end
