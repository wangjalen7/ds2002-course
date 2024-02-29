#!/bin/bash

IMAGE_URL="https://cc-prod.scene7.com/is/image/CCProdAuthor/adobe-firefly-marquee-text-to-image-0-desktop-1000x1000?\$pjpeg\$&jpegSize=300&wid=1000"
FILE_NAME="downloaded_image.jpg"
BUCKET="ds2002-zac9nk"

curl "$IMAGE_URL" -o "$FILE_NAME"

aws s3 cp "$FILE_NAME" s3://"$BUCKET"/"$FILE_NAME"

PRESIGNED_URL=$(aws s3 presign s3://"$BUCKET"/"$FILE_NAME" --expires-in 604800)

echo "Presigned URL (valid for 7 days): $PRESIGNED_URL"

# My generated URL: https://ds2002-zac9nk.s3.us-east-1.amazonaws.com/downloaded_image.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAYS2NVHZGRU4O5WUH%2F20240229%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240229T002654Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Security-Token=FwoGZXIvYXdzECIaDFkFjBp3UNKNEZ4WUCLEAc7ovjoieUf9w7qejKP0ZOx73phSj%2FzRJppMW0zvKLli1L4y1pD6EotOIugJdGviyi1cYofcO9XRE6Vxn0ZMe9a2k%2FV0NjN9x7qQu2N0TzorBjSHX8tPgrRjVVvWOI8OfssW92edT%2BWo%2B81QyCt2bvn0DH%2BN2B9okOurNxCslNjsiLutTINnRTXHSaof4ndnFwetR6FE5JoTbTD552j3Hj%2Bv7Ewg4ftGvOSlZwDrjkolfk5qSg%2Fmi0OUodss1d8wYy5pc0Aoj5b%2FrgYyLYPRVvAOH0Zc5K%2Bnh1sU6KyAu9aUM%2BwuTPICyQ8%2Fm1KyDuHC4nM9XN5GrHOtsA%3D%3D&X-Amz-Signature=9c750027ac50e7ef4c7af6700896355b1e3b99fb204b3c6bd8d0d59890a50a4b
