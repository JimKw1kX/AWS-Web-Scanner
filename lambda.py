import boto3
import json

client = boto3.client('ssm')

def lambda_handler(event, context):
    old_parameter = client.get_parameter(Name='nmap_target')  #target name you specified
    parameter_value ='https://www.example.com/'     # Target URL
    print (parameter_value)
    client.put_parameter(Name='nmap_target', Overwrite=True,
    Value=json.dumps(parameter_value))
    response = boto3.client(service_name='ecs').run_task(
		cluster='fargate-name',           #Fargate name you specified 
		taskDefinition='function name',   #Function name you specified 
		launchType='FARGATE',
		networkConfiguration={            #VPC Configuration
			'awsvpcConfiguration': {
				'subnets': [
					'subnet-037d707cb9ab76cec',
					'subnet-01bec9c64959f5512'
				],
				'securityGroups': [
					'sg-007ea0522e23a8f0a',
				],
				'assignPublicIp': 'ENABLED'					 	
			}
		} 
    )
    return 'ecs run task response: %s' % response
    return  parameter_value
