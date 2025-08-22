#!/bin/bash
helm upgrade --install myapp ./chart --namespace prod --create-namespace
