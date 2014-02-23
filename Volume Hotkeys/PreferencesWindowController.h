//
//  PreferencesWindowController.h
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/26/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PrefsWindowController.h"

@interface PreferencesWindowController : DBPrefsWindowController

@property (strong, nonatomic) IBOutlet NSView *generalPreferences;
@property (strong, nonatomic) IBOutlet NSView *shortcutsPreferences;
@property (strong, nonatomic) IBOutlet NSView *aboutApp;

@end
