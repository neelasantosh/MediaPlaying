//
//  VideoViewController.m
//  PlayingMedia
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "VideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize moviePlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initalize path of video file and start playing movie
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"video" ofType:@"mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSLog(@"%@",fileURL);
    
    moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:fileURL];
    
}//eof viewdidload

-(void)viewDidAppear:(BOOL)animated
{
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:true animated:true];
    [moviePlayer play];
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

@end
