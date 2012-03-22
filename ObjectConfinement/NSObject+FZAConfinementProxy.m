//
//  Created by leeg on 22/03/2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSObject+FZAConfinementProxy.h"
#import "FZAConfinementProxy.h"

@implementation NSObject (FZAConfinementProxy)

- (id)FZA_confinementProxy {
    return [[FZAConfinementProxy alloc] initWithRemoteObject: self];
}

@end