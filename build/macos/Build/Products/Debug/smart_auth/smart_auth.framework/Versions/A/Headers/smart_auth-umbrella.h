#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif


FOUNDATION_EXPORT double smart_authVersionNumber;
FOUNDATION_EXPORT const unsigned char smart_authVersionString[];

