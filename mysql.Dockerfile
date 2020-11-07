FROM python:3.8-slim
LABEL 维护者="佰阅 2894049053@qq.com"

ENV MYSQL_HOST='127.0.0.1'  
ENV MYSQL_PORT='3306'  
ENV MYSQL_USER='KAMIFKA'  
ENV MYSQL_PASSWORD='PASSWORD'  
ENV MYSQL_DATABASE='KAMIFKA'  

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# RUN python db_init.py

EXPOSE 8000

# ENTRYPOINT if ${DATABASE_TYPE} == 'Mysql'; &&\
#     then sed -i 's/os.path.join(SQL_PATH,\'kamifaka.db\')/\'${MYSQL_USER}:${MYSQL_PASSWORD}@${MYSQL_HOST}/${MYSQL_DATABASE}/?charset=utf8mb4\'/g' /usr/src/app/service/api/db.py; &&\
#     # 等待数据库响应

#     fi;
# 先挂载后entrypoint?
ENTRYPOINT ["python","init_mysql.py"]

# CMD ["gunicorn","-k", "gevent", "--bind", "0.0.0.0:8000", "--workers", "8", "app:app"]
#启动文件：文件内app
# ENTRYPOINT ["gunicorn","-k", "gevent", "--bind", "0.0.0.0:8000", "--workers", "8", "app:app"]

# docker run -itd -p 87:8000 ppt