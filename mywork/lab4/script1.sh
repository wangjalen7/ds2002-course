#!/bin/bash

IMAGE_URL="https://cc-prod.scene7.com/is/image/CCProdAuthor/adobe-firefly-marquee-text-to-image-0-desktop-1000x1000?\$pjpeg\$&jpegSize=300&wid=1000"
FILE_NAME="downloaded_image.jpg"
BUCKET="ds2002-zac9nk"

curl "$IMAGE_URL" -o "$FILE_NAME"

aws s3 cp "$FILE_NAME" s3://"$BUCKET"/"$FILE_NAME"

PRESIGNED_URL=$(aws s3 presign s3://"$BUCKET"/"$FILE_NAME" --expires-in 604800)

echo "Presigned URL (valid for 7 days): $PRESIGNED_URL"

# My generated URL: https://ds2002-zac9nk.s3.us-east-1.amazonaws.com/downloaded_image.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAYS2NVHZG76ZI7H6H%2F20240229%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240229T012738Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Security-Token=FwoGZXIvYXdzECMaDM4k1v2AMwTtoQ5TaCLEATiXB8%2BLeG36DQAGYAKMYJrlhDMODVYfhNu1GWCjm5gpGIEm0orjSW3mdX6LIyiYzGEBTDWhRNd5hK1YJ23fPmVIjQwMQbVtIvqbRFwVckITlLyhtNG9yppP1lJYIh78joTVihM7SaIimLX0B85uRScGD7nLV109DJWJ%2Brxt1UnhfnPb7oXBx3e7leCRk2L1RSsuUJzDJVR8wk6ML3v3LDMKo9staHHhb9gWHdkQc7DZY2AJHx392B4m8FzbG%2BNATT%2FqM2Yo%2B7n%2FrgYyLW7EaQMBVcgcT%2B7mjdo8Hs63difiJfGZDVJheXiy4AkiI3m4c87L4PQaA2bAXA%3D%3D&X-Amz-Signature=6323fb92da356ab5fdc6f7ff00d19244da4f51735cbd821357c08d5a35de13a7
