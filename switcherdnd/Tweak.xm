#import <Flipswitch/FSSwitchPanel.h>

%hook SpringBoard
// Hook the function that changes the Ringer mode
- (void)_updateRingerState:(int)state withVisuals:(_Bool)arg2 updatePreferenceRegister:(_Bool)arg3
{
	if ([[FSSwitchPanel sharedPanel] stateForSwitchIdentifier:@"com.a3tweaks.switch.flashlight"] == state){ 
		// Flip switch according to state
	[[FSSwitchPanel sharedPanel] applyActionForSwitchIdentifier:@"com.a3tweaks.switch.flashlight"];
	}
	return;
}
%end
