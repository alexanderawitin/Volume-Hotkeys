//
//  AppDelegate.m
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/25/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize freq, muteButtn, volFreq;

#pragma mark - ApplicationDelegate

- (void)awakeFromNib
{
    if ([NSSound isMuted]) {
        [muteButtn setTitle:@"Unmute"];
    }
    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"frequency"]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"0.0625" forKey:@"frequency"];
    }
    [freq setStringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"frequency"]];
    
    statusItem = [[StatusItemController alloc] init];
    statusItemImageChecker = [[StatusItemImageChecker alloc] init];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"firstRun"]) {
        [self openPreferencesWindow:nil];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:[NSDate date] forKey:@"firstRun"];
        [defaults setValue:@"0.0625" forKey:@"frequency"];
        [defaults setValue:NO forKey:@"openAtLogin"];
    }
    
    ShortcutsPreferences *sp = [ShortcutsPreferences alloc];
    [sp resetVolumeUpShortcutRegistration];
    [sp resetVolumeDownShortcutRegistration];
    [sp resetVolumeMuteShortcutRegistration];
}

#pragma mark - Actions

- (IBAction)openPreferencesWindow:(id)sender
{
    [[PreferencesWindowController sharedPrefsWindowController] showWindow:nil];
}

- (IBAction)queryDefaultAudioDevice:(id)sender
{
    NSString *defaultAudioDevice = [NSString stringWithFormat:@"The default audio device is: %@", [NSSound defaultOutputDeviceName]];
    NSAlert *alert = [NSAlert alertWithMessageText:defaultAudioDevice defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [alert runModal];
}

- (IBAction)queryCurSysVolume:(id)sender
{
    NSString *curVolTxt = [NSString stringWithFormat:@"The current volume for the default audio device is: %f", [NSSound systemVolume]];
    NSAlert *alert = [NSAlert alertWithMessageText:curVolTxt defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [alert runModal];
}

- (IBAction)increase:(id)sender
{
    /*[NSSound increaseSystemVolumeBy:[[[NSUserDefaults standardUserDefaults] valueForKey:@"frequency"] floatValue]];
    [statusItem updateStatusImage:[statusItemImageChecker newStatusItemImage]];
    [NSSound playFeedbackSound];*/
    [self runPythonScript:@"volup"];
}
- (IBAction)decrease:(id)sender
{
    /*[NSSound decreaseSystemVolumeBy:[[[NSUserDefaults standardUserDefaults] valueForKey:@"frequency"] floatValue]];
    [statusItem updateStatusImage:[statusItemImageChecker newStatusItemImage]];
    [NSSound playFeedbackSound];*/
    [NSSound test];
    [NSSound playFeedbackSound];
}

- (IBAction)muteUnmute:(id)sender
{
    if ([NSSound isMuted]) {
        [NSSound applyMute:NO];
        [NSSound playFeedbackSound];
        [muteButtn setTitle:@"Mute"];
    } else {
        [NSSound applyMute:YES];
        [muteButtn setTitle:@"Unmute"];
    }
    [statusItem updateStatusImage:[statusItemImageChecker newStatusItemImage]];
}

- (IBAction)checkIfMuted:(id)sender
{
    if ([NSSound isMuted]) {
        NSAlert *alert = [NSAlert alertWithMessageText:@"The system output volume is Muted." defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        [alert runModal];
    } else {
        NSAlert *alert = [NSAlert alertWithMessageText:@"The system output volume is not Muted." defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        [alert runModal];
    }
}

#pragma mark - Public Accessors

- (NSString *)getFreq
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"frequency"];
}

- (void)runPythonScript:(NSString *)opt
{
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/usr/bin/python";
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"MediaKeys" ofType:@"py"];
    task.arguments = [NSArray arrayWithObjects: scriptPath, opt, nil];
    
    [task launch];
}

@end
