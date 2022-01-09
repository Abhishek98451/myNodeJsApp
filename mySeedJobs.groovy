// Import all varibale and credential
import allDataVariable
//Create Folder
folder('myProjectSeed')
job('myProjectSeed/myProject'){
  //login in ecr and also docker using ecr command 
    steps {
        
          shell( "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com")
       
          
    }
     //Pull login in jenkins
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
