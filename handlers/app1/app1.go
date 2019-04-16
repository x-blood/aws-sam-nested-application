package main

import (
	"fmt"
	"context"
	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context) (string, error) {
	return fmt.Sprintf("App1! version_2"), nil
}

func main() {
	lambda.Start(HandleRequest)
}

