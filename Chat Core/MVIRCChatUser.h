#import <Foundation/Foundation.h>

#import "MVChatUser.h"
#import "MVChatUserPrivate.h"


NS_ASSUME_NONNULL_BEGIN

@class MVIRCChatConnection;

extern NSString *MVMetadataKeyForAttributeName(NSString *attributeName);
extern NSString *MVAttributeNameForMetadataKey(NSString *metadataKey);

@interface MVIRCChatUser : MVChatUser
+ (NSArray <NSString *> *) servicesNicknames;

- (instancetype) initLocalUserWithConnection:(MVIRCChatConnection *) connection;
- (instancetype) initWithNickname:(NSString *) nickname andConnection:(MVIRCChatConnection *) connection;
@end

@interface MVIRCChatUser (MVIRCChatUserPrivate)
- (void) persistLastActivityDate;
@end

NS_ASSUME_NONNULL_END
