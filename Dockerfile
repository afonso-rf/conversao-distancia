FROM alpine:3.15.0
RUN apk update && \
    apk add python3 && apk add py3-pip
WORKDIR /app
COPY ./requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app" ]
