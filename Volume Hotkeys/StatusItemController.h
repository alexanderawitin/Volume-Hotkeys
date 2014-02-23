//
//  StatusItemController.h
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/25/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "StatusItemImageChecker.h"
#import "AppDelegate.h"
#import "AudioDeviceCenter.h"

@interface StatusItemController : StatusItemImageChecker <NSMenuDelegate>

@property (nonatomic) IBOutlet NSStatusItem *statusItem;
@property (nonatomic) IBOutlet NSMenu *menu;
@property (nonatomic) IBOutlet AudioDeviceCenter *audioDeviceCenter;
@property (nonatomic) IBOutlet AudioDevice *audioDevice;


- (void)updateStatusImage:(NSImage *)newStatusImage;

@end
