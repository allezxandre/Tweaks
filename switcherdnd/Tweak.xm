#import <Flipswitch/FSSwitchPanel.h>

@interface NSUserDefaults (Private)

- (instancetype)_initWithSuiteName:(NSString *)suiteName container:(NSURL *)container;
- (instancetype)initWithSuiteName:(NSString *)suitename;

@end

// Shameless copy from Kirb (Adam D) to implement settings
static NSString *const kSWDNDPreferencesDomain = @"in.jouand.switcherdndprefs";
static NSString *const kSWDNDPreferencesEnabledKey = @"Enabled";
static NSString *const kSWDNDPreferencesRingerBehaviorKey = @"Behavior";

NSUserDefaults *userDefaults;

%ctor {
// Initialize settings 
  userDefaults = [[NSUserDefaults alloc] initWithSuiteName:kSWDNDPreferencesDomain];
  [userDefaults registerDefaults:@{
      kSWDNDPreferencesEnabledKey: @YES,
      kSWDNDPreferencesRingerBehaviorKey: @1
  }];
};

%hook SpringBoard
// Hook the function that changes the Ringer mode
- (void)_updateRingerState:(int)state withVisuals:(_Bool)arg2 updatePreferenceRegister:(_Bool)arg3
{
	// NSLog(@"[SwitcherDND] updateRingerState:%i withVisuals:%d updatePreferenceRegister:%d",state,arg2,arg3);
	if ([userDefaults boolForKey:kSWDNDPreferencesEnabledKey])
	{
		if ([[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"] == state)
		{
			// Flip-switch DND according to 'state'
			[[FSSwitchPanel sharedPanel] applyActionForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"];
		}

		if (arg3) // if we have to "updatePreferenceRegister" (arg3 = YES), then the iPhone is setting up after a boot/respring/reboot
		{
			switch ([userDefaults integerForKey:kSWDNDPreferencesRingerBehaviorKey]) // What setting should we apply for the ringer? 
			{
				case 1: // Set to switch state
					%orig;
					// NSLog(@"[SwitcherDND] Behavior: Physical Switch");
					break;
				case 2: // Always ON
					%orig(1,arg2,arg3);
					// NSLog(@"[SwitcherDND] Behavior: Always ON");
					break;
				case 3: // Always OFF
					%orig(0,arg2,arg3);
					// NSLog(@"[SwitcherDND] Behavior: Always OFF");
					break;
				default:
					NSLog(@"[SwitcherDND] ERROR: WTF is that? Bro, do you even integer? (Result = %@)",[userDefaults valueForKey:kSWDNDPreferencesRingerBehaviorKey]);
					break;
			}
		}
	} else { // SwitcherDND is disabled -> act as %orig
		%orig;
	}
}
%end
