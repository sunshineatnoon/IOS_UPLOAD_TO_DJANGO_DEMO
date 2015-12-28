# IOS_UPLOAD_TO_DJANGO_DEMO
This is a simple demo shows how to upload image from IOS app to Django server, with both the IOS end and Django server end implementations.

## To run the server

```
python manage.py migrate
cd myproject/
python manage.py runserver 0.0.0.0:8000
```

## To run the IOS App

- Open the workspcae using this command: `open uploadTest.xcworkspace`
- Change the ip address to your server's ip address in Line 28 and 33 in ViewController.m
- Run the app

###### Technical details can be found on my [blog](http://sunshineatnoon.github.io/How-to-upload-to-Django-server-from-IOS/)
