//
//  RecognizeViewController.h
//  Template Framework Project
//
//  Created by HD on 16/6/17.
//  Copyright © 2016年 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>

@interface RecognizeViewController : UIViewController<G8TesseractDelegate>
@property(nonatomic,strong) UIImage *image;

@end
