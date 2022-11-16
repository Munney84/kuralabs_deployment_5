FROM python:latest

RUN apt update 
RUN apt -y install git
RUN sleep 3
RUN apt -y install python3-pip
RUN sleep 3
RUN git clone https://github.com/Munney84/kuralabs_deployment_5.git
RUN sleep 2
WORKDIR /kuralabs_deployment_5/
RUN pip install -r requirements.txt
RUN pip install gunicorn
EXPOSE 8000
ENTRYPOINT ["python3","-m","gunicorn","-w","4","application:app","-b","0.0.0.0"] 


