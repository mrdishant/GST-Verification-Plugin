#import "GstVerificationPlugin.h"
#import <gst_verification/gst_verification-Swift.h>

@implementation GstVerificationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGstVerificationPlugin registerWithRegistrar:registrar];
}
@end
