//
//  StatusItemImageChecker.m
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 4/25/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import "StatusItemImageChecker.h"

@implementation StatusItemImageChecker

- (NSImage *)newStatusItemImage
{
    float array[] = { 0.03125, 0.0625, 0.09375, 0.125, 0.15625, 0.1875, 0.21875, 0.25, 0.28125, 0.3125, 0.34375, 0.375, 0.40625, 0.4375, 0.46875, 0.5, 0.53125, 0.5625, 0.59375, 0.625, 0.65625, 0.6875, 0.71875, 0.75, 0.78125, 0.8125, 0.84375, 0.875, 0.90625, 0.9375, 0.96875, 1.0 };
    float curVol = [NSSound systemVolume];
    
    NSString *imageName = @"";
    
    if ([NSSound isMuted])
        imageName = @"Volume1";
    else if (curVol == 0 || curVol < array[0])
        imageName = @"Volume1";
    else if ((curVol < array[1] && curVol > array[0]) || curVol == array[1])
        imageName = @"Volume2";
    else if ((curVol < array[2] && curVol > array[1]) || curVol == array[2])
        imageName = @"Volume2";
    else if ((curVol < array[3] && curVol > array[2]) || curVol == array[3])
        imageName = @"Volume2";
    else if ((curVol < array[4] && curVol > array[3]) || curVol == array[4])
        imageName = @"Volume2";
    else if ((curVol < array[5] && curVol > array[4]) || curVol == array[5])
        imageName = @"Volume2";
    else if ((curVol < array[6] && curVol > array[5]) || curVol == array[6])
        imageName = @"Volume2";
    else if ((curVol < array[7] && curVol > array[6]) || curVol == array[7])
        imageName = @"Volume2";
    else if ((curVol < array[8] && curVol > array[7]) || curVol == array[8])
        imageName = @"Volume2";
    else if ((curVol < array[9] && curVol > array[8]) || curVol == array[9])
        imageName = @"Volume2";
    else if ((curVol < array[10] && curVol > array[9]) || curVol == array[10])
        imageName = @"Volume3";
    else if ((curVol < array[11] && curVol > array[10]) || curVol == array[11])
        imageName = @"Volume3";
    else if ((curVol < array[12] && curVol > array[11]) || curVol == array[12])
        imageName = @"Volume3";
    else if ((curVol < array[13] && curVol > array[12]) || curVol == array[13])
        imageName = @"Volume3";
    else if ((curVol < array[14] && curVol > array[13]) || curVol == array[14])
        imageName = @"Volume3";
    else if ((curVol < array[15] && curVol > array[14]) || curVol == array[15])
        imageName = @"Volume3";
    else if ((curVol < array[16] && curVol > array[15]) || curVol == array[16])
        imageName = @"Volume3";
    else if ((curVol < array[17] && curVol > array[16]) || curVol == array[17])
        imageName = @"Volume3";
    else if ((curVol < array[18] && curVol > array[17]) || curVol == array[18])
        imageName = @"Volume3";
    else if ((curVol < array[19] && curVol > array[18]) || curVol == array[19])
        imageName = @"Volume3";
    else if ((curVol < array[20] && curVol > array[19]) || curVol == array[20])
        imageName = @"Volume3";
    else if ((curVol < array[21] && curVol > array[20]) || curVol == array[21])
        imageName = @"Volume4";
    else if ((curVol < array[22] && curVol > array[21]) || curVol == array[22])
        imageName = @"Volume4";
    else if ((curVol < array[23] && curVol > array[22]) || curVol == array[23])
        imageName = @"Volume4";
    else if ((curVol < array[24] && curVol > array[23]) || curVol == array[24])
        imageName = @"Volume4";
    else if ((curVol < array[25] && curVol > array[24]) || curVol == array[25])
        imageName = @"Volume4";
    else if ((curVol < array[26] && curVol > array[25]) || curVol == array[26])
        imageName = @"Volume4";
    else if ((curVol < array[27] && curVol > array[26]) || curVol == array[27])
        imageName = @"Volume4";
    else if ((curVol < array[28] && curVol > array[27]) || curVol == array[28])
        imageName = @"Volume4";
    else if ((curVol < array[29] && curVol > array[28]) || curVol == array[29])
        imageName = @"Volume4";
    else
        imageName = @"Volume4";
        
    NSString *path = [NSString stringWithFormat:@"/System/Library/CoreServices/Menu Extras/Volume.menu/Contents/Resources/%@.pdf",imageName];
    NSImage *newStatusImage = [[NSImage alloc] initByReferencingURL:[[NSURL alloc] initFileURLWithPath:path]];
    [newStatusImage setTemplate:YES];
    
    return newStatusImage;
}

@end
