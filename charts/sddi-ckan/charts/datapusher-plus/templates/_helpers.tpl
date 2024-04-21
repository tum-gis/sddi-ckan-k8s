{{/*
Expand the name of the chart.
*/}}
{{- define "datapusher-plus.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "datapusher-plus.fullname" -}}
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
{{- define "datapusher-plus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "datapusher-plus.labels" -}}
helm.sh/chart: {{ include "datapusher-plus.chart" . }}
{{ include "datapusher-plus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "datapusher-plus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "datapusher-plus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "datapusher-plus.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "datapusher-plus.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "datapusher-plus.sqlalchemy.url" -}}
  {{- if .Values.global.datapusher.db.enabled | default .Values.db.enabled -}}
    postgresql://
    {{- .Values.global.datapusher.db.auth.username | default .Values.db.auth.username -}}:
    {{- .Values.global.datapusher.db.auth.password | default .Values.db.auth.password -}}@
    {{- .Values.global.datapusher.db.host | default .Values.db.host -}}:
    {{- .Values.global.datapusher.db.port | default .Values.db.port -}}/
    {{- .Values.global.datapusher.db.dbname | default .Values.db.dbname -}}
  {{- else -}}
    {{ .Values.databaseUri }}
  {{- end }}
{{- end }}

{{/*
Write engine URL
*/}}
{{- define "datapusher-plus.writeEngine.url" -}}
    postgresql://
    {{- .Values.global.datapusher.db.auth.username | default .Values.db.auth.username -}}:
    {{- .Values.global.datapusher.db.auth.password | default .Values.db.auth.password -}}@
    {{- .Values.global.datastore.host | default .Values.datastore.host -}}:
    {{- .Values.global.datastore.port | default .Values.datastore.port -}}/
    {{- .Values.global.datastore.dbname | default .Values.datastore.dbname -}}
{{- end }}
