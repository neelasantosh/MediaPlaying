//
//  AudioRecordViewController.m
//  PlayingMedia
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "AudioRecordViewController.h"

@interface AudioRecordViewController ()

@end

@implementation AudioRecordViewController
@synthesize segment,recorder,filePath,player;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // intialize file path
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docDirpath = [pathArray objectAtIndex:0];
    
    filePath = [NSString stringWithFormat:@"%@/myvoice.m4a",docDirpath];
    
    segment.selectedSegmentIndex = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeOptions:(id)sender {
    
    switch (segment.selectedSegmentIndex) {
        case 0://record
        {
            //create recording options in dictionary
           
            NSMutableDictionary *settings = [[NSMutableDictionary alloc]init];
            //set format of recording
            NSNumber *numFormat = [[NSNumber alloc]initWithInt:kAudioFormatAppleLossless];
            [settings setObject:numFormat forKey:AVFormatIDKey];
            
            //set sampling rate
            NSNumber *numRate = [[NSNumber alloc]initWithFloat:44100.0];
            [settings setObject:numRate forKey:AVSampleRateKey];
            
            //set encoder audio quality
            NSNumber *numQuality = [NSNumber numberWithInt:AVAudioQualityLow];
            [settings setObject:numQuality forKey:AVEncoderAudioQualityKey];
            
            //set number of channels
            NSNumber *numChannels = [NSNumber numberWithInt:1];
            [settings setObject:numChannels forKey:AVNumberOfChannelsKey];
            
            
            //set filepath and setting dictionary with recorder object
            NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
            NSError *error  =nil;
            recorder = [[AVAudioRecorder alloc]initWithURL:fileUrl settings:settings error:&error];
            
            //start recording
            if (recorder != nil)//recorder is intialized
            {
                [recorder prepareToRecord];//to check setting
                [recorder record];
            }
            else
                NSLog(@"error:%@",error);
        }
            break;
            
            
    case 1://stop
        {
            if (recorder!=nil && [recorder isRecording])
            {
                [recorder stop];
                recorder = nil;
                NSLog(@"file saved:%@",filePath);
            }
        }
            case 2://play recording
        {
            NSURL *playUrl = [NSURL URLWithString:filePath];
            player = [[AVAudioPlayer alloc]initWithContentsOfURL:playUrl error:nil];
            [player prepareToPlay];
            [player play];
            
        }
        default:
            break;
    }
}
@end
