//
//  V2TopicModel.h
//  v2ex
//
//  Created by sixleaves on 15/9/21.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface V2TopicModel : NSObject

@property (nonatomic, copy) NSString *topicId;
@property (nonatomic, copy) NSString *topicTitle;
@property (nonatomic, copy) NSString *topicReplyCount;
@property (nonatomic, copy) NSString *topicUrl;
@property (nonatomic, copy) NSString *topicContent;
@property (nonatomic, copy) NSString *topicContentRendered;
@property (nonatomic, copy) NSNumber *topicCreated;
@property (nonatomic, copy) NSString *topicCreatedDescription;
@property (nonatomic, copy) NSString *topicModified;
@property (nonatomic, copy) NSString *topicTouched;

@property (nonatomic, strong) NSArray            *quoteArray;
@property (nonatomic, copy  ) NSAttributedString *attributedString;
@property (nonatomic, strong) NSArray            *contentArray;
@property (nonatomic, strong) NSArray            *imageURLs;

@end
