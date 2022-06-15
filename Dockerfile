# Unfortunately there is only 'test' and 'latest' for tags
FROM kennethreitz/httpbin:latest

ARG IMAGE_NAME

LABEL name="${IMAGE_NAME}" \
      original-name="httpbin"

EXPOSE 8080

CMD ["gunicorn", "-b", "0.0.0.0:8080", "httpbin:app", "-k", "gevent"]

