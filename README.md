[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)
[![Follow @JimKwik_X](https://img.shields.io/twitter/follow/JimKwik_X?style=social)](https://x.com/JimKwik_X)

# AWS-Web-Scanner

# Info:

This project was developed by the author with a colleague, the task was to create a web scan tool using AWS [lambda function](https://aws.amazon.com/lambda/). This project does not include steps of configuring AWS for the scanner becasue this is not an AWS tutorial. 

# Overview:

This is the code of the AWS [lambda function](https://github.com/JimSolomon/AWS-Web-Scanner/blob/main/lambda.py) that calls a [docker image](https://github.com/JimSolomon/AWS-Web-Scanner/blob/main/Dockerfile) that runs by [Fargate](https://aws.amazon.com/fargate/) which can host docker images. Therefore, users can run web scan on AWS with higher speed with longer runtime than [lambda function](https://aws.amazon.com/lambda/), and users can also scan multiple target and store scan results on AWS such as [S3](https://aws.amazon.com/s3/) or [DynamoDB](https://aws.amazon.com/dynamodb/) for further investigation.


# Demo
Below is a `Nmap` scan results of a company from AWS.

![scan result](https://github.com/JimSolomon/AWS-Web-Scanner/blob/main/Pasted%20image%2020230402120701.png)
