FROM python:3.8-alpine
ENV BASE_URL=https://711-goodcall.api.tigerspike.com/api/v1/
ENV TZ=UTC
ENV PRICE_URL=https://projectzerothree.info/api.php?format=json
ENV DEVICE_NAME=SM-G973FZKAXSA
ENV OS_VERSION="Android 9.0.0"
ENV APP_VERSION=1.8.0.2027

RUN apk --update add --no-cache bash tzdata build-base libffi-dev openssl-dev

WORKDIR .

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
ENTRYPOINT [ "python", "app.py" ]
