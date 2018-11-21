//
//  VKWXViewController.m
//  IronMan
//
//  Created by MTTGCC on 11/05/2018.
//  Copyright (c) 2018 MTTGCC. All rights reserved.
//

#import "VKWXViewController.h"
#import <IronMan/MTTObject.h>
#import "VKVXPhotoPickerModule.h"
@interface VKWXViewController ()

@end

@implementation VKWXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    VKVXPhotoPickerModule * picker = [[VKVXPhotoPickerModule alloc] init];
    [picker chooseImageWithOption:@{} result:^(id result, BOOL keepAlive) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
