node {
    stage ('Git: Checkout') {
        git credentialsId: 'git-creds', url: 'https://github.com/pkahly/devops.git'
    }

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

    stage ('Docker: Pull') {
        def image = docker.image('kahlyp/devops:latest').pull()
    }

    stage ('Docker: Run Container in Dev') {

    }
}