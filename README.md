# 7-Eleven Python
What is this program? This is a simple Python/Flask script that lets you lock in a fuel price from the comfort of your computer. Using this is easier than using the modified APK that is floating around the internet, because you do not need to use any other apps to fake a GPS location, and it universally works whether you are using an iPhone or an Android device. 7-Eleven Python will also automatically lock in the maximum amount of fuel that you have funds for. For instance, if you have $38.97 in your 7-Eleven Price Lock account and fuel costs $1.13/L, you will be able to lock in 35 litres.

There is also a function that will automatically search a couple of websites for a reduction in fuel prices where if enabled, will automatically lock in that price for you. For example, if a service station has the price of Unleaded 98 for $1.28/L but only for an hour because it was a price error or they are out of normal unleaded fuel, it will still lock that price for you as long as the script is running in the background.

# Docker Usage
Clone the Git repo to your Docker host and build the image:

`docker build -t fuel .`

Then run the image in a container:

<pre><code>docker run -d \<br />
  --name 7Eleven_Fuel \<br />
  -p 5000:5000 \<br />
  fuel<br /></code></pre>

and browse to http://[Docker host IP]:5000.

You may also use one of the pre-built images available from <a>https://hub.docker.com/repository/docker/ingenieurmt/fuel</a>. These are kept up-to-date with the master repository as much as possible.

Other environment variables you can specify at runtime:

`BASE_URL`: The URL for the 7-Eleven API.<br />
`TZ`: Display time using the chosen timezone.<br />
`PRICE_URL`: The URL for the fuel price API (currently defaults to the API at projectzerothree.info)<br />
`DEVICE_NAME`: The name of the device reported on login to the 7-Eleven API (set by default in settings.py)<br />
`OS_VERSION`: The Android OS version reported on login to the 7-Eleven API (set by default in settings.py)<br />
`APP_VERSION`: The 7-Eleven app version reported on login to the 7-Eleven API (set by default in settings.py)

An example of running with environmental variables is as follows:

<pre><code>docker run -d \<br />
  -e APP_VERSION=1.7.1 \<br />
  -e TZ=Australia/Melbourne \<br />
  --name 7Eleven_Fuel \<br />
  -p 5000:5000 \<br />
  fuel<br /></code></pre>
