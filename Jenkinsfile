node {
    stage ('Git: Checkout') {
        git credentialsId: 'git-creds', url: 'https://github.com/pkahly/devops.git'
    }

    stage ('Gradle: Build') {

    }

    def image = null;
    stage ('Docker: Build Image') {
        image = docker.build('kahlyp/devops:latest')
    }

    stage ('Docker: Push') {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u kahlyp -p ${dockerHubPwd}"
        }
        image.push()
    }

    image = null;
    stage ('Docker: Pull') {
        image = docker.image('kahlyp/devops:latest')
        image.pull()
    }

    stage ('Docker: Run Container in Dev') {
        image.inside {
            sh 'echo test'
        }
    }
}