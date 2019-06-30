#import "HeadsetEventPlugin.h"
#import <headset_event/headset_event-Swift.h>

@implementation HeadsetEventPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHeadsetEventPlugin registerWithRegistrar:registrar];
}
@end
