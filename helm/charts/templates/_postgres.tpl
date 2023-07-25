{{- define "postgresUrl" }}
{{- with .Values.database.postgres }}
{{- printf "postgres://%s:%s@%s:%s/%s" .user .password .host .port .database | b64enc }}
{{- end }}
{{- end }}