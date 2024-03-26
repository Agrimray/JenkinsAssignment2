node {
    def WORKSPACE = "/var/lib/jenkins/workspace/springboot-deploy"
    def dockerImageTag = "springboot-deploy${env.BUILD_NUMBER}"

    try {
        notifyBuild('STARTED')

        stage('Clone Repo') {
            git branch: 'main', credentialsId: '0a48c43c-4ffb-4525-a501-dca58a731d33', url: 'https://github.com/Agrimray/JenkinsAssignment2.git'
        }

        stage('Build Docker') {
            dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
        }

        stage('Deploy Docker') {
            echo "Docker Image Tag Name: ${dockerImageTag}"
            sh "docker stop springboot-deploy || true && docker rm springboot-deploy || true"
            sh "docker run --name springboot-deploy -d -p 8085:8085 springboot-deploy:${env.BUILD_NUMBER}"
        }

    } catch (e) {
        currentBuild.result = "FAILED"
        throw e
    } finally {
        notifyBuild(currentBuild.result)
    }
}

def notifyBuild(String buildStatus = 'STARTED') {
    // build status of null means successful
    buildStatus =  buildStatus ?: 'SUCCESSFUL'

    // Default values
    def now = new Date()

    // message
    def subject = "${buildStatus}, Job: ${env.JOB_NAME} FRONTEND - Deployment Sequence: [${env.BUILD_NUMBER}] "
    def summary = "${subject} - Check On: (${env.BUILD_URL}) - Time: ${now}"
    def subject_email = "Spring boot Deployment"
    def details = """<p>${buildStatus} JOB </p>
    <p>Job: ${env.JOB_NAME} - Deployment Sequence: [${env.BUILD_NUMBER}] - Time: ${now}</p>
    <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME}</a>"</p>"""

    // Email notification
    emailext (
        to: "admin@gmail.com",
        subject: subject_email,
        body: details,
        recipientProviders: [[$class: 'DevelopersRecipientProvider']]
    )
}