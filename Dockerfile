FROM python:3.7.3-stretch

WORKDIR /housingMarketApp

COPY requirements.txt /housingMarketApp/requirements.txt

COPY Makefile /housingMarketApp/Makefile

RUN make install

COPY . /housingMarketApp

EXPOSE 80

ENTRYPOINT ["python", "/housingMarketApp/app.py"]
