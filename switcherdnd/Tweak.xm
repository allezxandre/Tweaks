#import <Flipswitch/FSSwitchPanel.h>

@interface NSUserDefaults (Private)

- (instancetype)_initWithSuiteName:(NSString *)suiteName container:(NSURL *)container;
- (instancetype)initWithSuiteName:(NSString *)suitename;

@end

// Shameless copy from Kirb (Adam D) to implement settings
static NSString *const kSWDNDPreferencesDomain = @"in.jouand.switcherdndprefs";
static NSString *const kSWDNDPreferencesEnabledKey = @"Enabled";
// static NSString *const kSWDNDPreferencesSwitchesKey = @"Switches";
// static NSString *const kSWDNDPreferencesSectionLabelKey = @"SectionLabel";
// static NSString *const kSWDNDPreferencesSwitchLabelsKey = @"SwitchLabels";

NSUserDefaults *userDefaults;

%ctor {
  userDefaults = [[NSUserDefaults alloc] initWithSuiteName:kSWDNDPreferencesDomain];
  [userDefaults registerDefaults:@{
      kSWDNDPreferencesEnabledKey: @YES
  }];
  // %init;
};

%hook SpringBoard
// Hook the function that changes the Ringer mode
- (void)_updateRingerState:(int)state withVisuals:(_Bool)arg2 updatePreferenceRegister:(_Bool)arg3
{
	//[userDefaults synchronize];
	if ([userDefaults boolForKey:kSWDNDPreferencesEnabledKey])
	{
		NSLog(@"HOOK SwitcherDND - Tweak is enabled: [userDefaults boolForKey = %d]", [userDefaults boolForKey:kSWDNDPreferencesEnabledKey]);
		if ([[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"] == state){ 
		// Flip switch according to state
		[[FSSwitchPanel sharedPanel] applyActionForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"];
		}
		NSLog(@"HOOK SwitcherDND - state = %d - updatePreferenceRegister:%d",state, arg3);
		if (arg3) // if we have to "updatePreferenceRegister", then the current state is the opposite to the ringer setting, right? 
		{
			BOOL state_of_ringer = [[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:@"com.a3tweaks.switch.ringer"];
			NSLog(@"HOOK SwitcherDND - state= %d - State of Ringer = %d",state, state_of_ringer);
			if (state != state_of_ringer) 
			{
				[[FSSwitchPanel sharedPanel] applyActionForSwitchIdentifier:@"com.a3tweaks.switch.ringer"];
			}
		}
	} else {
		NSLog(@"HOOK SwitcherDND - Tweak is disabled: [userDefaults boolForKey = %d]", [userDefaults boolForKey:kSWDNDPreferencesEnabledKey]);
		%orig;
	}
	
}
%end
