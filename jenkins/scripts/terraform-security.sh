#!/bin/bash

set -e

checkov -d .

tfsec .

terrascan scan

kics scan -p .

