#!/bin/bash
kubectl port-forward -n restate svc/restate 9070:9070 8080:8080 &
