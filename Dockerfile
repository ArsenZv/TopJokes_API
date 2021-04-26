FROM python:3.7

WORKDIR /opt/app

COPY . .

RUN pip3 install --no-cache-dir flask flask_restful python-dotenv

EXPOSE 2077

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=2077"]