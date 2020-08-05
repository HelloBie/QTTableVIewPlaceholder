//
//  UITableView+QTTableViewPlaceholder.m
//  QTTableVIewPlaceholder
//
//  Created by MasterBie on 2020/8/5.
//  Copyright © 2020 MasterBie. All rights reserved.
//

#import "UITableView+QTTableViewPlaceholder.h"
#import <objc/runtime.h>

const char *QTPlaceholderView;

@interface UITableView ()
@property(nonatomic,strong)UIView *qtPlaceholderView;
@end

@implementation UITableView (QTTableViewPlaceholder)

+ (void)qtLoadConfig{
    static dispatch_once_t qtTableViewPHtoken;
    dispatch_once(&qtTableViewPHtoken, ^{
        Method originReloadData = class_getInstanceMethod(self, @selector(reloadData));
        Method qtReloadData = class_getInstanceMethod(self, @selector(qt_reloadData));
        method_exchangeImplementations(originReloadData, qtReloadData);
    });
}


- (void)qt_reloadData{
    [self qt_reloadData];
    [self showOrHiddenPlaceholderView];
}

- (void)showOrHiddenPlaceholderView
{
    id<UITableViewDataSource> dataSource = self.dataSource;
    NSInteger sectionNum = [dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)] ? [dataSource numberOfSectionsInTableView:self] : 0;
    NSInteger rows = 0;
    for (int i = 0;i < sectionNum; i++) {
        rows += [dataSource tableView:self numberOfRowsInSection:i];
    }
    if (rows == 0) {
        self.qtPlaceholderView.hidden = NO;
        
    }else
    {
        self.qtPlaceholderView.hidden = YES;
    }
}

- (void)qtSetPlaceHolder:(UIView *)placeHolder
{
    [self setQtPlaceholderView:placeHolder];
    [self addSubview:placeHolder];
    [self showOrHiddenPlaceholderView];
}

- (void)setQtPlaceholderView:(UIView *)qtPlaceholderView
{
    objc_setAssociatedObject(self, &QTPlaceholderView, qtPlaceholderView , OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)qtPlaceholderView
{
    return objc_getAssociatedObject(self, &QTPlaceholderView);
}


@end
