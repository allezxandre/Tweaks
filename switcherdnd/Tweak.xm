#import <Flipswitch/FSSwitchPanel.h>

%hook SpringBoard
// Hook the function that changes the Ringer mode
- (void)_updateRingerState:(int)state withVisuals:(_Bool)arg2 updatePreferenceRegister:(_Bool)arg3
{
	if ([[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"] == state){ 
		// Flip switch according to state
	[[FSSwitchPanel sharedPanel] applyActionForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"];
	}
	//%orig;
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
}
%end
