#!/bin/bash
helm repo add codecentric https://codecentric.github.io/helm-charts
helm upgrade --install mailhog codecentric/mailhog

helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm upgrade --install prometheus stable/prometheus-operator --values prometheus-operator-values.yaml

kubectl apply -f traefik-servicemonitor.yaml
kubectl apply -f traefik-dashboard.yaml

helm upgrade --install blackbox-exporter stable/prometheus-blackbox-exporter --values blackbox-exporter-values.yaml
kubectl apply -f blackbox-exporter-dashboard.yaml
