//
//  ViewController.h
//  PlayingMedia
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;
@property (strong, nonatomic) IBOutlet UISlider *slider;
- (IBAction)hangePlayOption:(id)sender;
- (IBAction)ChangePlayPosition:(id)sender;

@property AVAudioPlayer *player;

-(void)updateSlider;

@end

