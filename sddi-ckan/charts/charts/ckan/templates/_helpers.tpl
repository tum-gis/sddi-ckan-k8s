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
  postgres://
  {{- .Values.db.auth.username -}}:
  {{- .Values.db.auth.password -}}@
  {{- .Values.db.host -}}:
  {{- .Values.db.port -}}/
  {{- .Values.db.dbname -}}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "ckan.datastore.rw.url" -}}
  postgresql://
  {{- .Values.datastore.auth.rw.username -}}:
  {{- .Values.datastore.auth.rw.password -}}@
  {{- .Values.datastore.host -}}:
  {{- .Values.datastore.port -}}/
  {{- .Values.datastore.dbname -}}
{{- end }}

{{/*
SQL alchemy url
*/}}
{{- define "ckan.datastore.ro.url" -}}
  postgresql://
  {{- .Values.datastore.auth.ro.username -}}:
  {{- .Values.datastore.auth.ro.password -}}@
  {{- .Values.datastore.host -}}:
  {{- .Values.datastore.port -}}/
  {{- .Values.datastore.dbname -}}
{{- end }}
