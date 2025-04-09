{{/*
Expand the name of the chart.
*/}}
{{- define "ckan.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ckan.fullname" -}}
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
{{- define "ckan.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ckan.labels" -}}
helm.sh/chart: {{ include "ckan.chart" . }}
{{ include "ckan.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ckan.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ckan.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ckan.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ckan.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "ckan.sqlalchemy.url" -}}
  postgresql://
  {{- .Values.global.db.auth.username | default .Values.db.auth.username -}}:
  {{- .Values.global.db.auth.password | default .Values.db.auth.password -}}@
  {{- .Values.global.db.host | default .Values.db.host -}}:
  {{- .Values.global.db.port | default .Values.db.port -}}/
  {{- .Values.global.db.dbname | default .Values.db.dbname -}}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "ckan.datastore.rw.url" -}}
  postgresql://
  {{- .Values.global.datastore.auth.rw.username | default .Values.datastore.auth.rw.username -}}:
  {{- .Values.global.datastore.auth.rw.password | default .Values.datastore.auth.rw.password -}}@
  {{- .Values.global.datastore.host | default .Values.datastore.host -}}:
  {{- .Values.global.datastore.port | default .Values.datastore.port -}}/
  {{- .Values.global.datastore.dbname | default .Values.datastore.dbname -}}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "ckan.datastore.ro.url" -}}
  postgresql://
  {{- .Values.global.datastore.auth.ro.username | default .Values.datastore.auth.ro.username -}}:
  {{- .Values.global.datastore.auth.ro.password | default .Values.datastore.auth.ro.password -}}@
  {{- .Values.global.datastore.host | default .Values.datastore.host -}}:
  {{- .Values.global.datastore.port | default .Values.datastore.port -}}/
  {{- .Values.global.datastore.dbname | default .Values.datastore.dbname -}}
{{- end }}
