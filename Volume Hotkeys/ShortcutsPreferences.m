//
//  ShortcutsPreferences.m
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/26/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "ShortcutsPreferences.h"

NSString *const kPreferenceKeyVolumeUpShortcut = @"volumeUpShortcut";
NSString *const kPreferenceKeyVolumeDownShortcut = @"volumeDownShortcut";
NSString *const kPreferenceKeyVolumeMuteShortcut = @"volumeMuteShortcut";
NSString *const kPreferenceKeyVolumeUpShortcutEnabled = @"volumeUpShortcutEnabled";
NSString *const kPreferenceKeyVolumeDownShortcutEnabled = @"volumeDownShortcutEnabled";
NSString *const kPreferenceKeyVolumeMuteShortcutEnabled = @"volumeMuteShortcutEnabled";

@implementation ShortcutsPreferences

- (void)awakeFromNib
{
    [self.volumeUpShortcutView bind:@"Enabled" toObject:self withKeyPath:@"volumeUpEnabled" options:nil];
    [self.volumeDownShortcutView bind:@"Enabled" toObject:self withKeyPath:@"volumeDownEnabled" options:nil];
    [self.volumeMuteShortcutView bind:@"Enabled" toObject:self withKeyPath:@"volumeMuteEnabled" options:nil];
    // Checkbox will enable and disable the shortcut view
    self.volumeUpShortcutView.associatedUserDefaultsKey = kPreferenceKeyVolumeUpShortcut;
    self.volumeDownShortcutView.associatedUserDefaultsKey = kPreferenceKeyVolumeDownShortcut;
    self.volumeMuteShortcutView.associatedUserDefaultsKey = kPreferenceKeyVolumeMuteShortcut;
}

#pragma mark -

- (BOOL)isVolumeUpEnabled
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPreferenceKeyVolumeUpShortcutEnabled];
}

- (void)setVolumeUpEnabled:(BOOL)enabled
{
    if (self.volumeUpEnabled != enabled) {
        [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kPreferenceKeyVolumeUpShortcutEnabled];
    }
}

- (void)resetVolumeUpShortcutRegistration
{
    if (self.volumeUpEnabled) {
        [MASShortcut registerGlobalShortcutWithUserDefaultsKey:kPreferenceKeyVolumeUpShortcut handler:^{
            [[AppDelegate alloc] increase:nil];
        }];
    } else {
        [MASShortcut unregisterGlobalShortcutWithUserDefaultsKey:kPreferenceKeyVolumeUpShortcut];
    }
}

#pragma mark -

- (BOOL)isVolumeDownEnabled
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPreferenceKeyVolumeDownShortcutEnabled];
}

- (void)setVolumeDownEnabled:(BOOL)enabled
{
    if (self.volumeDownEnabled != enabled) {
        [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kPreferenceKeyVolumeDownShortcutEnabled];
    }
}

- (void)resetVolumeDownShortcutRegistration
{
    if (self.volumeDownEnabled) {
        [MASShortcut registerGlobalShortcutWithUserDefaultsKey:kPreferenceKeyVolumeDownShortcut handler:^{
            [[AppDelegate alloc] decrease:nil];
        }];
    } else {
        [MASShortcut unregisterGlobalShortcutWithUserDefaultsKey:kPreferenceKeyVolumeDownShortcut];
    }
}

#pragma mark -

- (BOOL)isVolumeMuteEnabled
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPreferenceKeyVolumeMuteShortcutEnabled];
}

- (void)setVolumeMuteEnabled:(BOOL)enabled
{
    if (self.volumeMuteEnabled != enabled) {
        [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kPreferenceKeyVolumeMuteShortcutEnabled];
    }
}

- (void)resetVolumeMuteShortcutRegistration
{
    if (self.volumeMuteEnabled) {
        [MASShortcut registerGlobalShortcutWithUserDefaultsKey:kPreferenceKeyVolumeMuteShortcut handler:^{
            [[AppDelegate alloc] muteUnmute:nil];
        }];
    } else {
        [MASShortcut unregisterGlobalShortcutWithUserDefaultsKey:kPreferenceKeyVolumeMuteShortcut];
    }
}

@end
