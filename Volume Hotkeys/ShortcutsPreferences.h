//
//  ShortcutsPreferences.h
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/26/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "AppDelegate.h"
#import "MASShortcutView.h"
#import "MASShortcutView+UserDefaults.h"
#import "MASShortcut+UserDefaults.h"
#import "MASShortcut+Monitoring.h"

@class MASShortcutView;

@interface ShortcutsPreferences : NSObject

@property (nonatomic, weak) IBOutlet MASShortcutView *volumeUpShortcutView;
@property (nonatomic, weak) IBOutlet MASShortcutView *volumeDownShortcutView;
@property (nonatomic, weak) IBOutlet MASShortcutView *volumeMuteShortcutView;

@property (nonatomic, getter = isVolumeUpEnabled) BOOL volumeUpEnabled;
@property (nonatomic, getter = isVolumeDownEnabled) BOOL volumeDownEnabled;
@property (nonatomic, getter = isVolumeMuteEnabled) BOOL volumeMuteEnabled;

- (void)resetVolumeUpShortcutRegistration;
- (void)resetVolumeDownShortcutRegistration;
- (void)resetVolumeMuteShortcutRegistration;

@end
