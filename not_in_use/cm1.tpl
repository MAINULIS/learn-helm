apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-cm1
  {{- template "mychart.labels" . }}
data:
  myvalue: "Hello World"

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-cm2
  labels:
{{ include "mychart.app" . | indent 4 }}
data:
  myvalue: "Hello World"