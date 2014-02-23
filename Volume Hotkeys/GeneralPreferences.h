//
//  GeneralPreferences.h
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/26/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneralPreferences : NSObject

@property (nonatomic, getter = isOpenAtLoginEnabled) BOOL openAtLoginEnabled;

- (IBAction)openAtLogin:(id)sender;

@end
