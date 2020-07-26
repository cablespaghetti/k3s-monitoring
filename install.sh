#!/bin/bash
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm upgrade --install prometheus stable/prometheus-operator --values prometheus-operator-values.yaml
kubectl apply -f traefik-servicemonitor.yaml
