def call(String message) {

    slackSend(

        channel: '#devops-alerts',

        message: message
    )
}

