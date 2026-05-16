def call() {

    sh '''

    terraform init \
      -backend-config=environments/prod/backend.tfvars

    '''
}

