node {
    stage ('Git: Checkout') {
        git credentialsId: 'git-creds', url: 'https://github.com/pkahly/devops.git'
    }

    stage ('Gradle: Build') {

    }

    def image = null;
    stage ('Docker: Build Image') {
        //sh 'docker build -t kahlyp/devops:latest .'
        image = docker.build('kahlyp/devops:latest')
    }

    stage ('Docker: Push') {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u kahlyp -p ${dockerHubPwd}"
        }
        //sh 'docker push kahlyp/devops:latest'
        image.push()
    }

    def image = null;
    stage ('Docker: Pull') {
        image = docker.image('kahlyp/devops:latest').pull()
    }

    stage ('Docker: Run Container in Dev') {

    }
}