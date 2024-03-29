{{/*
Expand the name of the chart.
*/}}
{{- define "datapusher.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "datapusher.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "datapusher.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "datapusher.labels" -}}
helm.sh/chart: {{ include "datapusher.chart" . }}
{{ include "datapusher.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "datapusher.selectorLabels" -}}
app.kubernetes.io/name: {{ include "datapusher.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "datapusher.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "datapusher.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "datapusher.sqlalchemy.url" -}}
  {{- if .Values.global.datapusher.db.enabled | default .Values.db.enabled -}}
    postgres://
    {{- .Values.global.datapusher.db.auth.username | default .Values.db.auth.username -}}:
    {{- .Values.global.datapusher.db.auth.password | default .Values.db.auth.password -}}@
    {{- .Values.global.datapusher.db.host | default .Values.db.host -}}:
    {{- .Values.global.datapusher.db.port | default .Values.db.port -}}/
    {{- .Values.global.datapusher.db.dbname | default .Values.db.dbname -}}
  {{- else -}}
    {{ .Values.databaseUri }}
  {{- end }}
{{- end }}
