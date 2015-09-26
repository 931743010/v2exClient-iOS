//
//  V2MemberModel.h
//  v2ex
//
//  Created by sixleaves on 15/9/21.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface V2MemberModel : NSObject

@property (nonatomic, copy) NSString *memberId;
@property (nonatomic, copy) NSString *memberName;
@property (nonatomic, copy) NSString *memberAvatarMini;
@property (nonatomic, copy) NSString *memberAvatarNormal;
@property (nonatomic, copy) NSString *memberAvatarLarge;
@property (nonatomic, copy) NSString *memberTagline;

@property (nonatomic, copy) NSString *memberBio;
@property (nonatomic, copy) NSString *memberCreated;
@property (nonatomic, copy) NSString *memberLocation;
@property (nonatomic, copy) NSString *memberStatus;
@property (nonatomic, copy) NSString *memberTwitter;
@property (nonatomic, copy) NSString *memberUrl;
@property (nonatomic, copy) NSString *memberWebsite;

@end
