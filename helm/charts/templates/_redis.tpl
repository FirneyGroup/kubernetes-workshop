{{- define "redisUrl" }}
{{- with .Values.database.redis }}
{{- printf "redis://%s:%s/%s" .host .port .database | b64enc }}
{{- end }}
{{- end }}