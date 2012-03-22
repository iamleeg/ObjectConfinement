//
//  Created by leeg on 22/03/2012.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface FZAConfinementProxy : NSProxy

- (id)initWithRemoteObject: (id)confinedObject;

@end