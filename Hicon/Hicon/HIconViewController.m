//
//  HIconViewController.m
//  Hicon
//
//  Created by Puneet Rao on 15/05/2013.
//  Copyright (c) 2013 Puneet Rao. All rights reserved.
//
#import "HIconViewController.h"
#import "IconDownloader.h"

@interface HIconViewController ()

@end

@implementation HIconViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    imArray = [[NSMutableArray alloc] init];
    for(int i=0;i<50;i++)
    {
        if(i%5 == 0)
            [imArray addObject:@"https://static.propertytalker.com/suburb_multimedia/thumbs/5190d5762e9a8.jpg"];
        else if(i%5 == 1)
            [imArray addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG"];
        else if(i%5 == 2)
            [imArray addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0356.JPG"];
        else if(i%5 == 3)
            [imArray addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0357.JPG"];
        else if(i%5 == 4)
            [imArray addObject:@"http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0358.JPG"];
    }
    HemsUrlToImage *url = [[HemsUrlToImage alloc] init];
    url.delegate = self;
    url.identifier = @"scroll1";
    //Identifier to differentiate between different downloads
//    url.isNoCaching = YES;
    //Make it YES if you do not want caching otherwise NO or do not write this line
//    url.isSmallSize = YES;
    // This will download image in icon size of 100X100, Make it YES if you do want small size otherwise NO or do not write this line
    [url setImageArrayFromUrlArray:imArray];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellNew"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellNew"];
        UIImageView *imgVw = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 70, 70)];
        imgVw.tag = 1;
        
        UILabel *lblName = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 220, 80)];
        lblName.font = [UIFont boldSystemFontOfSize:16];
        lblName.backgroundColor = [UIColor clearColor];
        lblName.tag = 2;
        [cell.contentView addSubview:imgVw];
        [cell.contentView addSubview:lblName];
    }
    UIImageView *imgVw = (UIImageView*)[cell.contentView viewWithTag:1];
    UILabel *lblName = (UILabel*)[cell.contentView viewWithTag:2];
    lblName.text = [NSString stringWithFormat:@"Image %d",indexPath.row+1];
    imgVw.image = nil;
    if([[imArray objectAtIndex:indexPath.row] isKindOfClass:NSClassFromString(@"UIImage")])
        imgVw.image = [imArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HemsUrlToImageDelegate
-(void)urlToImageConverted:(NSArray *)convertedArray withIdentifier:(NSString *)identifier andIndex:(NSInteger)indexNumber
{
    imArray = [[NSMutableArray alloc] initWithArray:convertedArray];
    //[(UIImageView*)[[tbv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexNumber inSection:0]].contentView viewWithTag:1] setImage:[imArray objectAtIndex:indexNumber]];
    [tbv reloadData];
}
- (void)dealloc {
    [_img release];
    [tbv release];
    [super dealloc];
}
@end
