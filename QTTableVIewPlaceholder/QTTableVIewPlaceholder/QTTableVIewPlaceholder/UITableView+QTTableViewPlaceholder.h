//
//  UITableView+QTTableViewPlaceholder.h
//  QTTableVIewPlaceholder
//
//  Created by MasterBie on 2020/8/5.
//  Copyright © 2020 MasterBie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (QTTableViewPlaceholder)


/// 配置方法,调用一次即可,最好在Load中调用
+ (void)qtLoadConfig;

/// 设置展位图
/// @param placeHolder 无数据时展示的展位图
- (void)qtSetPlaceHolder:(UIView *)placeHolder;
@end

NS_ASSUME_NONNULL_END
