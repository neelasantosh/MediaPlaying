//
//  ViewController.m
//  PlayingMedia
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize segment,slider,player;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // intialize file for player
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"waka" ofType:@"mp3"];
    
    NSURL *fileUrl = [NSURL URLWithString:filePath];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:nil];
    
    segment.selectedSegmentIndex=2;//default stop
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hangePlayOption:(id)sender {
    
    switch (segment.selectedSegmentIndex) {
        case 0://play
        {
            if ([player isPlaying] == false) {
                
                [player prepareToPlay];
                [player play];
                
                //update slider
                
                slider.maximumValue = player.duration;
                [NSThread detachNewThreadSelector:@selector(updateSlider) toTarget:self withObject:nil];
                
                
            }
        }
        break;
            
            
        case 1://pause
        {
            if ([player isPlaying] == true)
            {
                [player pause];
            }
        }
            break;
            
        case 2://pause
        {
            if ([player isPlaying] == true)
            {
                [player stop];
                [player setCurrentTime:0];
            }
        }
            break;
            
        default:
            break;
    }
    
}

- (IBAction)ChangePlayPosition:(id)sender
{
    
    //set current position of playing as per slider new position
    player.currentTime = slider.value;
    
    
}

-(void)updateSlider
{
    //update slider accourding to current player position every 1/4th second
    while ([player isPlaying])
    {
        int currentPosition = player.currentTime;

        //slider.value = currentPosition;
        
        dispatch_async(dispatch_get_main_queue(), ^{slider.value = currentPosition;});
        [NSThread sleepForTimeInterval:0.01];
        
        
    }
}
@end
