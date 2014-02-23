//
//  StatusItemController.m
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/25/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "StatusItemController.h"
#import "AudioDeviceCenter.h"

@implementation StatusItemController

@synthesize statusItem, menu, audioDevice, audioDeviceCenter;

#pragma mark -
#pragma mark Initialization

- (StatusItemController *)init
{
    if (self = [super init]) {
        statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [statusItem setImage:[[StatusItemImageChecker alloc] newStatusItemImage]];
        [statusItem setHighlightMode:YES];
        
        audioDeviceCenter = [[AudioDeviceCenter alloc] init];
        audioDevice = [[AudioDevice alloc] init];
        
        [self initMenu];
    }
    
    return self;
}

- (void)initMenu
{
    menu = [[NSMenu alloc] initWithTitle:@"Volume Hotkeys Menu"];
    [menu setDelegate:self];
    NSMenuItem *menuItem;
    menuItem = [menu addItemWithTitle:@"Output Device:" action:nil keyEquivalent:@""];
    
    for (AudioDevice *device in [audioDeviceCenter outputDevices]) {
        menuItem = [menu addItemWithTitle:[device name] action:@selector(clickedMenuItem:) keyEquivalent:@""];
        [menuItem setTarget:self];
        [menuItem setTag:0];
    }
    
    [menu addItem:[NSMenuItem separatorItem]];
    [menu addItemWithTitle:@"Input Device:" action:nil keyEquivalent:@""];
    
    for (AudioDevice *device in [audioDeviceCenter inputDevices]) {
        menuItem = [menu addItemWithTitle:[device name] action:@selector(clickedMenuItem:) keyEquivalent:@""];
        [menuItem setTarget:self];
        [menuItem setTag:1];
    }
    
    [menu addItem:[NSMenuItem separatorItem]];
    
    menuItem = [menu addItemWithTitle:@"Preferences..." action:@selector(openPreferencesWindow:) keyEquivalent:@","];
    menuItem = [menu addItemWithTitle:@"About" action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""];
    menuItem = [menu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
    
    [statusItem setMenu:menu];
    [self updateMenuItemStates:menu];
}

#pragma mark -
#pragma mark NSMenuDelegate Methods

- (void)menuWillOpen:(NSMenu *)menu
{
    [self updateMenuItemStates:self.menu];
    NSLog(@"test");
}

#pragma mark -
#pragma mark User Event Handling

- (void)clickedMenuItem:(NSMenuItem *)menuItem
{
    AudioDeviceCenter *deviceCenter = [[AudioDeviceCenter alloc] init];
    NSString *menuItemName = menuItem.title;
    NSInteger menuitemTag = menuItem.tag;
    
    if (menuitemTag) {
        [deviceCenter setSelectedInputDevice:[self audioDeviceWithname:menuItemName]];
    } else {
        [deviceCenter setSelectedOutputDevice:[self audioDeviceWithname:menuItemName]];
    }
    
    [self updateStatusImage:[self newStatusItemImage]];
    [self updateMenuItemStates:menu];
}

- (AudioDevice *)audioDeviceWithname:(NSString *)name
{
    for (AudioDevice *device in [AudioDeviceCenter outputDevices]) {
        if ([name compare:[device name] options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            return device;
        }
    }
    return nil;
}

#pragma mark -
#pragma mark Menu Management

- (void)updateMenuItemStates:(NSMenu *)passedMenu
{
    [self updateStatusImage:[self newStatusItemImage]];
    AudioDevice *deviceOut = [[AudioDeviceCenter alloc] selectedOutputDevice];
    AudioDevice *deviceIn = [[AudioDeviceCenter alloc] selectedInputDevice];
    for(NSMenuItem *menuItem in passedMenu.itemArray) {
        NSString *menuItemName = [menuItem title];
        NSInteger menuItemTag = [menuItem tag];
        
        switch (menuItemTag) {
            case 0:
                if([menuItemName isEqualToString:[deviceOut name]]) {
                    [menuItem setState:NSOnState];
                } else {
                    [menuItem setState:NSOffState];
                }
                break;
                
            case 1:
                if([menuItemName isEqualToString:[deviceIn name]]) {
                    [menuItem setState:NSOnState];
                } else {
                    [menuItem setState:NSOffState];
                }
                break;
                
            default:
                break;
        }
    }
}

- (void)updateStatusImage:(NSImage *)newStatusImage
{
    [statusItem setImage:[self newStatusItemImage]];
}

@end
