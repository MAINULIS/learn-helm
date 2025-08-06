{{- if .Values.configmap.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-cm1
  {{- template "mychart.labels" }}
data:
  myvalue: "Hello World"
