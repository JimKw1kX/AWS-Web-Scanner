# AWS-Web-Scanner
This is an AWS [lambda function](https://github.com/JimSolomon/AWS-Web-Scanner/blob/main/lambda.py) that calls [docker image](https://github.com/JimSolomon/AWS-Web-Scanner/blob/main/Dockerfile) that runs by Fargate. Therefore, users can run web scan on AWS with higher speed, and users can also scan multiple target and store scan results on AWS such as [S3](https://aws.amazon.com/s3/) or [DynamoDB](https://aws.amazon.com/dynamodb/) for further investigation.


# Demo
Below is a `Nmap` scan results of a company.

![scan result](https://github.com/JimSolomon/AWS-Web-Scanner/blob/main/Pasted%20image%2020230402120701.png)
