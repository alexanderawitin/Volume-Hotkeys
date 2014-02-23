//
//  AudioDeviceCenter.h
//  Volume Hotkeys
//
//  Created by Alexander Awitin on 5/17/13.
//  Copyright (c) 2013 Alexander Awitin. All rights reserved.
//

#import <CoreAudio/CoreAudio.h>

@interface AudioDevice : NSObject
{
	AudioDeviceID	_deviceID;
	OSType			_sourceType;
	BOOL			_isInput;
}

- (id)initWithAudioDeviceID: (AudioDeviceID)deviceID source: (OSType)source isInput: (BOOL)flag;

- (BOOL)isEqual: (AudioDevice*)device;
- (NSComparisonResult)compare: (AudioDevice*)device;

- (NSString*)name;
- (BOOL)canBeDefaultDevice;
- (BOOL)canBeDefaultSystemDevice;

- (AudioDeviceID)coreAudioDeviceID;
- (BOOL)coreAudioIsInput;
- (OSType)coreAudioSourceType;
- (OSType)fetchCoreAudioSourceType;

@end

@interface AudioDeviceCenter : NSObject
{
	BOOL			_audioFollowsJack;
	AudioDeviceID	_previousDefaultDevice;
}

- (id)init;

- (NSArray*)inputDevices;
- (NSArray*)outputDevices;

- (AudioDevice*)deviceWithID: (AudioDeviceID)deviceID isInput: (BOOL)isInput;
- (NSArray*)devicesWithTransportType: (unsigned)type isInput: (BOOL)isInput;

- (void)setSelectedInputDevice: (AudioDevice*)device;
- (AudioDevice*)selectedInputDevice;
- (void)setSelectedOutputDevice: (AudioDevice*)device;
- (AudioDevice*)selectedOutputDevice;
- (void)setSelectedSystemDevice: (AudioDevice*)device;
- (AudioDevice*)selectedSystemDevice;

- (float)inputVolume;
- (void)setInputVolume: (float)vol;
- (float)outputVolume;
- (void)setOutputVolume: (float)vol;
//- (float)systemVolume;
//- (void)setSystemVolume: (float)vol;

- (BOOL)supportsAudioFollowsJack;
- (void)setAudioFollowsJack: (BOOL)flag;
- (BOOL)audioFollowsJack;

@end
