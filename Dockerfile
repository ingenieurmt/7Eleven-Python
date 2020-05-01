FROM python:3.8.2-alpine3.11
ENV BASE_URL=https://apps.7eleven.com.au/api/v1/
ENV TZ=UTC
ENV PRICE_URL=https://projectzerothree.info/api.php?format=json
ENV DEVICE_NAME=SM-G973FZKAXSA
ENV OS_VERSION="Android 9.0.0"
ENV APP_VERSION=1.10.0.2044

RUN apk --update add --no-cache bash tzdata build-base libffi-dev openssl-dev

WORKDIR /opt/fuel/

COPY . /opt/fuel/
RUN pip install --no-cache-dir -r requirements.txt

RUN adduser --system fuel \
    && chown -R fuel /opt/fuel/
USER fuel

EXPOSE 5000
ENTRYPOINT [ "python", "/opt/fuel/app.py" ]

LABEL maintainer="matthew@thompsons.id.au"
