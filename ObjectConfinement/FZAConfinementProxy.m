//
//  Created by leeg on 22/03/2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FZAConfinementProxy.h"
#import <objc/runtime.h>

static const void *FZAProxyAssociation = (const void *)@"FZAConfinementProxyAssociationName";

@implementation FZAConfinementProxy {
    id remoteObject;
    NSOperationQueue *operationQueue;
}

- (id)initWithRemoteObject:(id)confinedObject {
    id existingProxy = objc_getAssociatedObject(confinedObject, FZAProxyAssociation);
    if (existingProxy) {
        self = nil;
        return existingProxy;
    }
    remoteObject = confinedObject;
    if ([remoteObject isKindOfClass: [UIView class]]) {
        operationQueue = [NSOperationQueue mainQueue];
    } else {
        operationQueue = [[NSOperationQueue alloc] init];
        operationQueue.maxConcurrentOperationCount = 1;
    }
    objc_setAssociatedObject(confinedObject, FZAProxyAssociation, self, OBJC_ASSOCIATION_ASSIGN);
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (sel == @selector(initWithRemoteObject:)) {
        return [NSMethodSignature signatureWithObjCTypes: "@@:@"];
    }
    else {
        return [remoteObject methodSignatureForSelector: sel];
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation setTarget: remoteObject];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithInvocation: invocation];
    [operationQueue addOperation: operation];
}

- (void)dealloc {
    objc_setAssociatedObject(remoteObject, FZAProxyAssociation, nil, OBJC_ASSOCIATION_ASSIGN);
}

@end