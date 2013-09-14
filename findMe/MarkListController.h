//
//  MarkListController.h
//  По следам
//
//  Created by user on 13.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarkListController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property NSMutableArray *arr;
@end
