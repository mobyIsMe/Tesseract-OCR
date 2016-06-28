//
//  RecognizeViewController.m
//  Template Framework Project
//
//  Created by HD on 16/6/17.
//  Copyright © 2016年 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import "RecognizeViewController.h"
#import "ResultViewController.h"

@implementation RecognizeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"待识别图片";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = self.image;
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2);
    [self.view addSubview:imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, self.view.frame.size.height-50-20,self.view.frame.size.width-2*20, 50);
    button.backgroundColor = [UIColor purpleColor];
    [button setTitle:@"识别" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(recognizeImageWithTesseract) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)recognizeImageWithTesseract
{
        //self.image  待识别的图片
    //     操作 G8ViewController 里的  -(void)recognizeImageWithTesseract:(UIImage *)image 方法，在结果页吧结果传到第三个页面
    
    // 假设这里有结果了 
 
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];

    UIImage *bwImage = [self.image g8_blackAndWhite];

    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng+chi_sim"];
    
    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
    
    
    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
    
    
    operation.delegate = self;
    
    
    operation.tesseract.image = bwImage;
    
    
    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
        // Fetch the recognized text
        NSString *recognizedText = tesseract.recognizedText;
        
        NSLog(@"%@", recognizedText);
        
        ResultViewController *resultViewController  = [[ResultViewController alloc] init];
        resultViewController.resultString = recognizedText;
        [self.navigationController pushViewController:resultViewController animated:YES];
    };
    
    [operationQueue addOperation:operation];

    
  
}


- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"progress: %lu", (unsigned long)tesseract.progress);
}


- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;  // return YES, if you need to cancel recognition prematurely
}

@end
