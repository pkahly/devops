node {
    stage ('Gradle: Build') {

    }

    stage ('Docker: Build Image') {
        sh 'docker build -t kahlyp/devops:latest .'
    }

    stage ('Docker: Push') {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u kahlyp -p ${dockerHubPwd}"
        }
        sh 'docker push kahlyp/devops:latest'
    }

    stage ('Docker: Run Container in Dev') {

    }
}