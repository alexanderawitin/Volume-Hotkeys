#import <Cocoa/Cocoa.h>

@interface DBPrefsWindowController : NSWindowController

@property (nonatomic) BOOL crossFade;
@property (nonatomic) BOOL shiftSlowsAnimation;

+ (DBPrefsWindowController *)sharedPrefsWindowController;
+ (NSString *)nibName;

- (void)setupToolbar;
- (void)addFlexibleSpacer;
- (void)addView:(NSView *)view label:(NSString *)label;
- (void)addView:(NSView *)view label:(NSString *)label image:(NSImage *)image;

- (void)toggleActivePreferenceView:(NSToolbarItem *)toolbarItem;
- (void)displayViewForIdentifier:(NSString *)identifier animate:(BOOL)animate;
- (void)crossFadeView:(NSView *)oldView withView:(NSView *)newView;
- (NSRect)frameForView:(NSView *)view;

// select both the view & toolbar item for the given identifier
- (void)loadViewForIdentifier:(NSString *)identifier animate:(BOOL)animate;

@end
