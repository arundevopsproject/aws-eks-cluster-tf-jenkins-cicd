def call() {

    sh '''

    checkov -d .

    tfsec .

    terrascan scan

    '''
}
