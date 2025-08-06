apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-cm2
data:
  {{- $files := .Files }}
  {{- range tuple "config1.toml" "config2.toml" "config3.toml" }}
  {{ . }}: |-
    {{ $files.Get . }}
  {{- end }}