def call() {

    sh '''

    terraform plan \
      -var-file=environments/prod/terraform.tfvars \
      -out=tfplan

    '''
}
