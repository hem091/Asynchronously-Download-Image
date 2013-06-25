//
//  HIconViewController.h
//  Hicon
//
//  Created by Puneet Rao on 15/05/2013.
//  Copyright (c) 2013 Puneet Rao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HemsUrlToImage.h"
@interface HIconViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,HemsUrlToImageDelegate>
{
    NSMutableArray *imArray;
    IBOutlet UITableView *tbv;
}
@property (retain, nonatomic) IBOutlet UIImageView *img;

@end
