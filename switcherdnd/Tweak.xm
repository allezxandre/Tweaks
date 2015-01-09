#import <Flipswitch/FSSwitchPanel.h>

@interface SpringBoard
{
	int _ringerSwitchState;
}
@end

%hook SpringBoard

//-(void)_ringerChanged:(struct __IOHIDEvent *)arg1
- (void)_updateRingerState:(int)arg1 withVisuals:(_Bool)arg2 updatePreferenceRegister:(_Bool)arg3
{

	// Check if vibrate
/*
	int *public_ringer_switch_state;
	public_ringer_switch_state = MSHookIvar<int *>(self, "_ringerSwitchState");
	//object_getInstanceVariable(self, "_ringerSwitchState", (void**)&state);
	NSLog(@"Hook: _ringerChanged %i", *public_ringer_switch_state);
*/
	// Check if DND is enabled
	//if ([fsp stateForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"] == 0){
		// Flip switch according to state
		[[FSSwitchPanel sharedPanel] applyActionForSwitchIdentifier:@"com.a3tweaks.switch.do-not-disturb"];
	//}
	return ;//%orig; // temp

}

%end
