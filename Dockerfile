FROM python:3.7

WORKDIR /opt/app

COPY . .

RUN pip install --no-cache-dir flask python-dotenv

EXPOSE 2077

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=2077"]