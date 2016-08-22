#import <Preferences/PSListController.h>

@interface switcherdndprefsListController: PSListController {
}
@end

@implementation switcherdndprefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"switcherdndprefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
