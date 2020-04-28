# This script can be used to tag an untagged ECR image given its SHA.
# This is useful if an old image whose tag was replaced needs to be
# pulled, which is only possible if it's tagged.
REPOSITORY=emmaa
IMAGE_SHA=d35530cb7fec422e6b9ed4cc62b5b75a7250a1893e73dfe8a52525db8fd8876f
TAG=backup
MANIFEST=$(aws ecr batch-get-image --repository-name $REPOSITORY --image-ids imageDigest=sha256:$IMAGE_SHA --query 'images[].imageManifest' --output text)
aws ecr put-image --repository-name $REPOSITORY --image-tag $TAG --image-manifest "$MANIFEST"
