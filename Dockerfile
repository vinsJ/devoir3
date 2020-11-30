# STEP 1 : We'll use python as a base of our dockefile. 

FROM python:3.8.4

#STEP 2 : We add the content of the manager folder into our container. 

ADD manager /scripts

#STEP 3 : We need to install all the dependencies

RUN pip install psycopg2

#STEP 4: This is a script to wait on the database !

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]

#STEP 5 : lets tell docker that he needs to run the script.py when creating the container from our image. 

CMD ["python","-m","scripts"]