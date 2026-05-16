def call() {

    sh '''

    terraform apply -auto-approve tfplan

    '''
}
