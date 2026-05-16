def call(String chartName) {

    sh """

    helm upgrade --install ${chartName} ./helm/${chartName}

    """
}
