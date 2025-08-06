{{- define "mychart.labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}

{{- if .Values.configmap.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
  {{- template "mychart.labels" }}
data:
  myvalue: "Hello World"
{{- end }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-1
  {{- template "mychart.labels" }}
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink | default "tea" | quote }}
  food: {{ .Values.favorite.food | upper | quote }}
  {{ if eq .Values.favorite.drink "coffee" }}mug: "true"{{ end }}
  {{ if eq .Values.favorite.drink "coffee" }}
  sugar: "true"
  {{ end }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  {{- with .Values.favorite }}
  drink: {{ .drink | default "tea" | quote }}
  food: {{ .food | upper | quote }}
  release: {{ $.Release.Name }}
  {{- end }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-2
data:
  myvalue: "Hello World"
  toppings: |-
    {{- range .Values.pizzaToppings }}
    - {{ . | title | quote }}
    {{- end }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap-3
data:
  myvalue: "Hello World"
  {{- $relname := .Release.Name -}} ## here we are declaring variable
  {{- with .Values.favorite }}
  drink: {{ .drink | default "tea" | quote }}
  food: {{ .food | upper | quote }}
  release: {{ $relname }}
  {{- end }}