FROM python:3.12-slim
WORKDIR /app
COPY app/ /app/
RUN mkdir -p /app/logs
ENV STUDENT_NAME=Laura \
    STUDENT_SURNAME=Nysanbekova \
    STUDENT_GROUP=IT2-2309 \
    STUDENT_ID=37962
EXPOSE 8080
CMD ["python", "app.py"]
