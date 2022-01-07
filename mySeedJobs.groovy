import allDataVariable
AWS_ACCOUNT_ID="755606765953"
AWS_DEFAULT_REGION="ap-south-1" 
IMAGE_REPO_NAME="myphp"
IMAGE_TAG="latest"
REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
folder('myProjectSeed')
job('myProjectSeed/myProject'){
    scm{
        git('https://github.com/Abhishek98451/myNodeJsApp.git')
    }
    steps {
        
          shell( "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com")
       
          
    }
    steps{
      scm{
        git('https://github.com/Abhishek98451/myNodeJsApp.git')
      }
    }
    // Building Docker images
    steps{
      shell(dockerImage ="docker build -t ${IMAGE_REPO_NAME}:${IMAGE_TAG}")
      
    }
    // Uploading Docker images into AWS ECR
    steps{ 
      shell("docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG") 
      }
    steps{
      shell("docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}")
    }
}