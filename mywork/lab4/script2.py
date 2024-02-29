#!/usr/bin/env python3.8

import boto3
import requests

image_url = "https://i0.wp.com/images.onwardstate.com/uploads/2015/05/oie_14175751vZSQRLEn.gif?fit=650%2C408&ssl=1"
bucket_name = "ds2002-zac9nk"
file_name = "downloaded_image.gif"
object_name = file_name

response = requests.get(image_url)

with open(file_name, "wb") as f:
    f.write(response.content)


s3 = boto3.client('s3', region_name='us-east-1')
s3.put_object(Body=response.content, Bucket=bucket_name, Key=object_name, ACL='public-read', ContentType='image/gif')

presigned_url = s3.generate_presigned_url('get_object', Params={'Bucket': bucket_name, 'Key': object_name}, ExpiresIn=604800)
print("Presigned URL (valid for 7 days):", presigned_url)

# My generated URL: https://ds2002-zac9nk.s3.amazonaws.com/downloaded_image.gif?AWSAccessKeyId=ASIAYS2NVHZG76ZI7H6H&Signature=efF6rjSl2mus5auYZSCvGY8sRM8%3D&x-amz-security-token=FwoGZXIvYXdzECMaDM4k1v2AMwTtoQ5TaCLEATiXB8%2BLeG36DQAGYAKMYJrlhDMODVYfhNu1GWCjm5gpGIEm0orjSW3mdX6LIyiYzGEBTDWhRNd5hK1YJ23fPmVIjQwMQbVtIvqbRFwVckITlLyhtNG9yppP1lJYIh78joTVihM7SaIimLX0B85uRScGD7nLV109DJWJ%2Brxt1UnhfnPb7oXBx3e7leCRk2L1RSsuUJzDJVR8wk6ML3v3LDMKo9staHHhb9gWHdkQc7DZY2AJHx392B4m8FzbG%2BNATT%2FqM2Yo%2B7n%2FrgYyLW7EaQMBVcgcT%2B7mjdo8Hs63difiJfGZDVJheXiy4AkiI3m4c87L4PQaA2bAXA%3D%3D&Expires=1709774900
