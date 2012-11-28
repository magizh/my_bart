# Rails app using Bart API 

     This is a simple rails app that uses Bart API and gives you the list of trains to workplace/home
     depending on the time of the day. Fork the app and make your own customizations :) 

![Snapshot](/public/sh.png)


### The app uses 

* The app uses [Bart API](http://api.bart.gov/docs/overview/index.aspx) to get real time schedules
* It uses the nokogiri gem to parse the XML 
* [Bootstrap](http://twitter.github.com/bootstrap/index.html) to make it responsive :)


### Deploy your app on [Cloud Foundry](http://www.cloudfoundry.com/)

* [Fork the app](https://github.com/mahil/my_bart/fork_select) 

```ruby
git clone git@github.com:<your_name>/my_bart.git my_bart
```

* Get the API keys from [here](http://api.bart.gov/api/register.aspx)
* Customize your routes in the home_controller.rb file

After doing the necessary changes 

```ruby
bundle install; bundle package;
rake assets:precompile
vmc push --runtime=ruby19
Would you like to deploy from the current directory? [Yn]: 
Application Name: magizhtransit
Detected a Rails Application, is this correct? [Yn]: 
Application Deployed URL [magizhtransit.cloudfoundry.com]: 
Memory reservation (128M, 256M, 512M, 1G, 2G) [256M]: 
How many instances? [1]: 
Bind existing services to 'magizhtransit'? [yN]: 
Create services to bind to 'magizhtransit'? [yN]: 
Would you like to save this configuration? [yN]: 
Creating Application: OK
Uploading Application:
  Checking for available resources: OK
  Processing resources: OK
  Packing application: OK
  Uploading (365K): OK   
Push Status: OK
Staging Application 'magizhtransit': OK                                         
Starting Application 'magizhtransit': OK 
```

## Yeah ! 
