//
//  HemsUrlToImage.m
//  Hicon
//
//  Created by Hemant Sharma on 25/06/2013.
//  Copyright (c) 2013 Hemant Sharma. All rights reserved.
//

#import "HemsUrlToImage.h"
@implementation HemsUrlToImage
@synthesize delegate,isNoCaching,isSmallSize,identifier;

-(void)setImageArrayFromUrlArray:(NSArray*)urlArray
{
    imageDownloadsinProgress = [[NSMutableDictionary alloc] init];
    mainURLArray = [[NSMutableArray alloc] initWithArray:urlArray];
    for(int i=0;i<[mainURLArray count];i++)
    {
        IconDownloader* icondownloader;
        icondownloader = [imageDownloadsinProgress objectForKey:[NSString stringWithFormat:@"%d",i]];
        if(icondownloader==nil)
        {
            icondownloader =[[IconDownloader alloc]init];
            icondownloader.urlstring=[urlArray objectAtIndex:i];
            icondownloader.delegate=self;
            if(!isNoCaching)
                icondownloader.isCaching = @"yes";
            else
                icondownloader.isCaching = @"no";
            if(isSmallSize)
                icondownloader.main = @"no";
            else
                icondownloader.main = @"yes";
            icondownloader.nameatindexPath=[NSString stringWithFormat:@"%d",i];
            [imageDownloadsinProgress setObject:icondownloader forKey:[NSString stringWithFormat:@"%d",i]];
            [icondownloader startDownload];
            [icondownloader release];
        }
    }
}
- (void)cancelDownload
{
    for (NSIndexPath *indexPath in [imageDownloadsinProgress allKeys]) {
        IconDownloader *d = [imageDownloadsinProgress objectForKey:indexPath];
        [d cancelDownload];
    }
}
- (void)appImageDidLoad:(NSString *)nameatindexPath
{
	IconDownloader * icondownloader = [imageDownloadsinProgress objectForKey:nameatindexPath];
    if(icondownloader!=nil)
    {
        if (icondownloader.iconimage!=nil)
        {
            [mainURLArray replaceObjectAtIndex:[nameatindexPath integerValue] withObject:icondownloader.iconimage];
            [delegate urlToImageConverted:mainURLArray withIdentifier:(NSString*)identifier andIndex:(NSInteger)[nameatindexPath integerValue]];
        }
    }
}
@end
