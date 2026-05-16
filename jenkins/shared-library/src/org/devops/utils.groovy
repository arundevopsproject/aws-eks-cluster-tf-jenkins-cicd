package org.devops

class utils implements Serializable {

    static void printBanner(script, String msg) {

        script.echo "======================================"

        script.echo msg

        script.echo "======================================"
    }
}
