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

# My generated URL: https://ds2002-zac9nk.s3.amazonaws.com/downloaded_image.gif?AWSAccessKeyId=ASIAYS2NVHZGRU4O5WUH&Signature=T02kBoY%2Bkb12dOR9qBTFQg3IXF0%3D&x-amz-security-token=FwoGZXIvYXdzECIaDFkFjBp3UNKNEZ4WUCLEAc7ovjoieUf9w7qejKP0ZOx73phSj%2FzRJppMW0zvKLli1L4y1pD6EotOIugJdGviyi1cYofcO9XRE6Vxn0ZMe9a2k%2FV0NjN9x7qQu2N0TzorBjSHX8tPgrRjVVvWOI8OfssW92edT%2BWo%2B81QyCt2bvn0DH%2BN2B9okOurNxCslNjsiLutTINnRTXHSaof4ndnFwetR6FE5JoTbTD552j3Hj%2Bv7Ewg4ftGvOSlZwDrjkolfk5qSg%2Fmi0OUodss1d8wYy5pc0Aoj5b%2FrgYyLYPRVvAOH0Zc5K%2Bnh1sU6KyAu9aUM%2BwuTPICyQ8%2Fm1KyDuHC4nM9XN5GrHOtsA%3D%3D&Expires=1709773796
