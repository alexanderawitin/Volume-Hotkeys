//
//  AppDelegate.h
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/25/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ISSoundAdditions.h"
#import "StatusItemController.h"
#import "StatusItemImageChecker.h"
#import "PreferencesWindowController.h"
#import "GeneralPreferences.h"
#import "ShortcutsPreferences.h"
#import "AudioDeviceCenter.h"

@class StatusItemController;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet StatusItemController *statusItem;
    IBOutlet StatusItemImageChecker *statusItemImageChecker;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *freq;
@property (weak) IBOutlet NSButton *muteButtn;
@property (nonatomic, getter = getFreq) NSString *volFreq;

- (IBAction)openPreferencesWindow:(id)sender;
- (IBAction)queryDefaultAudioDevice:(id)sender;
- (IBAction)queryCurSysVolume:(id)sender;
- (IBAction)increase:(id)sender;
- (IBAction)decrease:(id)sender;
- (IBAction)muteUnmute:(id)sender;
- (IBAction)checkIfMuted:(id)sender;

@end
