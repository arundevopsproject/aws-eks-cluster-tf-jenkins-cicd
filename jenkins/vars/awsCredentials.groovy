def call() {

    withCredentials([

        [$class: 'AmazonWebServicesCredentialsBinding',

         credentialsId: 'aws-prod-creds']
    ]) {

        sh 'aws sts get-caller-identity'
    }
}

