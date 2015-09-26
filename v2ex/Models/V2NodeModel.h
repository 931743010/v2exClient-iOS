//
//  V2NodeModel.h
//  v2ex
//
//  Created by sixleaves on 15/9/21.
//  Copyright © 2015年 sixleaves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface V2NodeModel : NSObject

@property (nonatomic, copy) NSString *nodeId;
@property (nonatomic, copy) NSString *nodeName;
@property (nonatomic, copy) NSString *nodeUrl;
@property (nonatomic, copy) NSString *nodeTitle;
@property (nonatomic, copy) NSString *nodeTitleAlternative;
@property (nonatomic, copy) NSString *nodeTopicCount;
@property (nonatomic, copy) NSString *nodeHeader;
@property (nonatomic, copy) NSString *nodeFooter;
@property (nonatomic, copy) NSString *nodeCreated;

@end
