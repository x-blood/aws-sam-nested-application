#!/bin/sh

# Build app1
GOOS=linux go build ./handlers/app1/app1.go
mv ./app1 ./handlers/app1/

# Build app2
GOOS=linux go build ./handlers/app2/app2.go
mv ./app2 ./handlers/app2/

# Create Package
aws cloudformation package \
  --template-file template.yml \
  --output-template-file template-output.yml \
  --s3-bucket aws-sam-nested-application-packages \
  --profile temp_profile

# Deploy
aws cloudformation deploy \
  --template-file template-output.yml \
  --stack-name aws-sam-nested-application \
  --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
  --profile temp_profile