# Simple Web Application

This is a simple web application using [Python Flask](http://flask.pocoo.org/) and [MySQL](https://www.mysql.com/) database. 
This is used in the demonstration of development of Ansible Playbooks.
  Choose a GitHub repository in which our Python Web App is Deployed
 
Add our Python web application code: Push our Python web application code to the repository, including a requirements.txt file listing all the dependencies required by your application.
 
Create a build.sh script: Create a build.sh script in the root of your repository. This script will contain the commands necessary to build our application. 
 
 
Set up GitHub Actions: Create a directory named .github/workflows in the root of your repository. Inside this directory, create a YAML file to define your GitHub Actions workflow.

Commit and push changes: Commit the changes you've made (including the build.sh script, requirements.txt, and the GitHub Actions workflow file) and push them to the main branch of your repository.
With these steps, every time you push changes to the main branch of your repository, GitHub Actions will trigger the CI/CD pipeline defined in the ci-cd.yml file. This pipeline will:

Install dependencies specified in requirements.txt.
Execute the build.sh script.

  Below are the steps required to get this working on a base linux system.
  
  - Install all required dependencies
  - Install and Configure Database
  - Start Database Service
  - Install and Configure Web Server
  - Start Web Server
   
## 1. Install all required dependencies
  
  Python and its dependencies

    apt-get install -y python python-setuptools python-dev build-essential python-pip python-mysqldb

   
## 2. Install and Configure Database
    
 Install MySQL database
    
    apt-get install -y mysql-server mysql-client

## 3. Start Database Service
  - Start the database service
    
        service mysql start

  - Create database and database users
        
        # mysql -u <username> -p
        
        mysql> CREATE DATABASE employee_db;
        mysql> GRANT ALL ON *.* to db_user@'%' IDENTIFIED BY 'Passw0rd';
        mysql> USE employee_db;
        mysql> CREATE TABLE employees (name VARCHAR(20));
        
  - Insert some test data
        
        mysql> INSERT INTO employees VALUES ('JOHN');
    
## 4. Install and Configure Web Server

Install Python Flask dependency

    pip install flask
    pip install flask-mysql

- Copy app.py or download it from source repository
- Configure database credentials and parameters 

## 5. Start Web Server

Start web server

    FLASK_APP=app.py flask run --host=0.0.0.0
    
## 6. Test

Open a browser and go to URL

    http://<IP>:5000                            => Welcome
    http://<IP>:5000/how%20are%20you            => I am good, how about you?
    http://<IP>:5000/read%20from%20database     => JOHN
