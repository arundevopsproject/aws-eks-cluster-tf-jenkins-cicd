def call() {

    sh '''

    terraform destroy \
      -auto-approve \
      -var-file=environments/prod/terraform.tfvars

    '''
}

