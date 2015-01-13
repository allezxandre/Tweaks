@class UITextInputTraits;

@interface UIKeyboard : UIView //<UIKeyboardImplGeometryDelegate>
{
    // UIView *m_snapshot;
    // UITextInputTraits *m_defaultTraits;
    // BOOL m_typingDisabled;
    // BOOL m_minimized;
    // BOOL m_respondingToImplGeometryChange;
    // int m_orientation;
    // int m_idiom;
    // BOOL m_hasExplicitOrientation;
}

//  + (BOOL)splitKeyboardEnabled;
//  + (BOOL)isInHardwareKeyboardMode;
//  + (struct CGSize)keyboardSizeForInterfaceOrientation:(int)arg1;
//  + (struct CGSize)sizeForInterfaceOrientation:(int)arg1;
//  + (BOOL)shouldMinimizeForHardwareKeyboard;
//  + (BOOL)respondsToProxGesture;
//  + (BOOL)isOnScreen;
//  + (struct CGRect)defaultFrameForInterfaceOrientation:(int)arg1;
//  + (struct CGSize)defaultSizeForInterfaceOrientation:(int)arg1;
//  + (struct CGSize)defaultSize;
//  + (void)removeAllDynamicDictionaries;
//  + (void)initImplementationNow;
//  + (void)clearActiveForScreen:(id)arg1;
//  + (void)makeKeyboardActive:(id)arg1 forScreen:(id)arg2;
//  + (id)activeKeyboardForScreen:(id)arg1;
+ (void)_clearActiveKeyboard;
+ (id)activeKeyboard;
//  @property(nonatomic) int keyboardIdiom; // @synthesize keyboardIdiom=m_idiom;
//  - (void)_resizeForKeyplaneSize:(struct CGSize)arg1 splitWidthsChanged:(BOOL)arg2;
//  @property(nonatomic) BOOL showsCandidatesInline;
//  - (BOOL)canDismiss;
//  - (void)implBoundsHeightChangeDone:(float)arg1 suppressNotification:(BOOL)arg2;
//  - (void)prepareForImplBoundsHeightChange:(float)arg1 suppressNotification:(BOOL)arg2;
//  - (struct UIPeripheralAnimationGeometry)geometryForImplHeightDelta:(float)arg1;
//  - (void)keyboardMinMaximized:(id)arg1 finished:(id)arg2 context:(id)arg3;
//  @property(nonatomic, getter=isMinimized) BOOL minimized;
- (void)maximize;
- (void)minimize;
//  - (void)_setPasscodeOutlineAlpha:(float)arg1;
//  - (void)_setRenderConfig:(id)arg1;
//  - (id)targetWindow;
//  - (void)responseContextDidChange;
//  - (void)setCorrectionLearningAllowed:(BOOL)arg1;
//  - (struct UIPeripheralAnimationGeometry)geometryForMinimize:(BOOL)arg1;
//  - (void)syncMinimizedStateToHardwareKeyboardAttachedState;
//  - (BOOL)shouldSaveMinimizationState;
//  - (void)setShowPredictionBar:(BOOL)arg1;
//  - (BOOL)showPredictionBar;
//  - (void)setDisableInteraction:(BOOL)arg1;
//  - (BOOL)disableInteraction;
//  - (void)setCursorLocation:(int)arg1;
//  - (int)cursorLocation;
//  - (void)_moveWithEvent:(id)arg1;
//  - (void)_wheelChangedWithEvent:(id)arg1;
//  - (void)remoteControlReceivedWithEvent:(id)arg1;
//  - (void)_physicalButtonsCancelled:(id)arg1 withEvent:(id)arg2;
//  - (void)_physicalButtonsEnded:(id)arg1 withEvent:(id)arg2;
//  - (void)_physicalButtonsBegan:(id)arg1 withEvent:(id)arg2;
//  - (BOOL)canHandleEvent:(id)arg1;
//  - (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
//  - (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
//  - (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
//  - (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
//  - (int)textEffectsVisibilityLevel;
//  - (void)displayLayer:(id)arg1;
//  - (void)setNeedsDisplay;
  - (void)_deactivateForBackgrounding;
  - (void)deactivate;
//  - (BOOL)isActive;
  - (void)activate;
//  @property(nonatomic) BOOL typingEnabled;
//  - (void)takeSnapshot;
//  - (void)clearSnapshot;
//  - (id)delegate;
//  - (void)setDefaultTextInputTraits:(id)arg1;
//  - (id)defaultTextInputTraits;
//  - (void)setReturnKeyEnabled:(BOOL)arg1;
//  - (BOOL)returnKeyEnabled;
//  @property(nonatomic) BOOL caretVisible;
//  @property(nonatomic) BOOL caretBlinks;
//  - (BOOL)hasAutocorrectPrompt;
//  - (void)acceptAutocorrection;
//  - (void)removeAutocorrectPrompt;
//  - (void)geometryChangeDone:(BOOL)arg1;
//  - (void)prepareForGeometryChange;
//  - (BOOL)pointInside:(struct CGPoint)arg1 withEvent:(id)arg2;
//  - (BOOL)pointInside:(struct CGPoint)arg1 forEvent:(struct __GSEvent *)arg2;
//  - (id)hitTest:(struct CGPoint)arg1 withEvent:(id)arg2;
//  - (void)setOrientation:(int)arg1;
//  - (int)interfaceOrientation;
//  - (void)updateLayout;
//  - (void)setFrame:(struct CGRect)arg1;
//  - (void)setBounds:(struct CGRect)arg1;
//  - (struct CGSize)intrinsicContentSize;
//  - (void)didMoveToWindow;
//  - (void)willMoveToWindow:(id)arg1;
//  - (void)clearActivePerScreenIfNeeded;
//  - (BOOL)isActivePerScreen;
  - (void)dealloc;
//  - (id)initLazily;
//  - (id)initWithDefaultSize;
//  - (id)initWithFrame:(struct CGRect)arg1;
//  - (id)_initWithFrame:(struct CGRect)arg1 lazily:(BOOL)arg2;
//  - (void)autoAdjustOrientationForSize:(struct CGSize)arg1;
//  - (void)autoAdjustOrientation;
- (void)manualKeyboardWasOrderedOut;
//  - (void)manualKeyboardWillBeOrderedOut;
//  - (void)manualKeyboardWasOrderedIn;
//  - (void)manualKeyboardWillBeOrderedIn;
//  - (int)_positionInCandidateList:(id)arg1;
//  - (BOOL)_hasCandidates;
//  - (void)_acceptCurrentCandidate;
//  - (id)_getAutocorrection;
//  - (void)_setAutocorrects:(BOOL)arg1;
//  - (void)_setInputMode:(id)arg1;
//  - (id)_typeCharacter:(id)arg1 withError:(struct CGPoint)arg2 shouldTypeVariants:(BOOL)arg3 baseKeyForVariants:(BOOL)arg4;
//  - (id)_touchPoint:(struct CGPoint)arg1;
//  - (void)_setSplit:(BOOL)arg1;
//  - (void)_setUndocked:(BOOL)arg1;
//  - (void)_changeToKeyplane:(id)arg1;
//  - (id)_keyplaneNamed:(id)arg1;
//  - (id)_keyplaneForKey:(id)arg1;
//  - (id)_baseKeyForRepresentedString:(id)arg1;
//  - (id)_getLocalizedInputMode;
//  - (id)_getCurrentKeyboardName;
//  - (id)_getCurrentKeyplaneName;
//  - (BOOL)_isAutomaticKeyboard;

@end

/*
@interface UIView : UIResponder
{
}
+ (Class)layerClass;
- (BOOL)endEditing:(BOOL)arg1;
@end
*/



