#! /bin/sh

# connect to virtual enviroment.
source ./env/bin/activate

# install requirements.
pip install -r requirements.txt

# make the peoject.
django-admin startproject core 

# make the home project
cd core/
python manage.py startapp home

# Add the 'home' app to settings.py
ed ./core/settings.py < ../settings.ed

# inclue the 'home/urls.py'
sed -i '' '/from\ django.urls\ import\ path/d' ./core/urls.py
ed ./core/urls.py < ../core-urls-1.ed
ed ./core/urls.py < ../core-urls-2.ed

# touch 'home/urls.py'
touch ./home/urls.py
ed ./home/urls.py < ../home-urls.ed





