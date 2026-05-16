def call() {

    sh '''

    terraform plan -detailed-exitcode || true

    '''
}

