#!/bin/bash
DEPLOY=${1:-myapp}
NAMESPACE=${2:-default}
kubectl rollout restart deployment $DEPLOY -n $NAMESPACE
