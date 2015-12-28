//
//  ViewController.m
//  uploadTest
//
//  Created by 李雪婷 on 15/12/23.
//  Copyright (c) 2015年 李雪婷. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)BtnClick:(id)sender {
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://server.url"]];
    UIImage *image = [UIImage imageNamed:@"1.jpeg"];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSDictionary *parameters = @{@"name":@"sunshineatnoon"};
    AFHTTPRequestOperation *op = [manager POST:@"http://your.server.ip.address:8000/myapp/list/" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
    [formData appendPartWithFileData:imageData name:@"docfile" fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject[@"ImgName"]);
        NSString *urlStr = [NSString stringWithFormat:@"http://your.server.ip.address:8000%@",responseObject[@"ImgName"]];
        NSURL *url = [NSURL URLWithString:urlStr];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        
        self.imgViewController.image = img;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
    }];
    op.responseSerializer.acceptableContentTypes = [op.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [op start];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
