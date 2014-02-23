//
//  PreferencesWindowController.m
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/26/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "PreferencesWindowController.h"

@interface PreferencesWindowController ()

@end

@implementation PreferencesWindowController

@synthesize generalPreferences, shortcutsPreferences, aboutApp;

- (void)setupToolbar
{
    [self addView:generalPreferences label:@"General" image:[NSImage imageNamed:NSImageNamePreferencesGeneral]];
    [self addView:shortcutsPreferences label:@"Shortcuts" image:[NSImage imageNamed:@"shortcutsPrefs"]];
    [self addFlexibleSpacer];
    [self addView:aboutApp label:@"About" image:[NSImage imageNamed:NSImageNameInfo]];
}

@end
