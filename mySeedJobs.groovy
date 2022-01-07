import allDataVariable
folder('myProjectSeed')
job('myProjectSeed/myProject'){
    scm{
        git('https://github.com/Abhishek98451/myNodeJsApp.git')
    }
    steps {
        script {
        sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
        }
          
    }
    // Building Docker images
    steps{
      script {
        dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
      }
    }
    // Uploading Docker images into AWS ECR
    steps{  
        script {
              sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
              sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
        }
      }
}