node {
    stage ('Gradle: Build') {

    }

    stage ('Docker: Build Image') {
        sh 'docker build -t pkahly/devops:latest'
    }

    stage ('Docker: Push') {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u pkahly -p ${dockerHubPwd}"
        }
        sh 'docker push pkahly/devops:latest'
    }

    stage ('Docker: Run Container in Dev') {
        
    }
}