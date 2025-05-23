# 1 - Basic Concepts
When we think of load and performance issues, we often think of![img.png](img.png) outages where websites are going down at the least opportune times and that is certainly an issue.
**But it's more than just websites going down.**
The speed and responsiveness of your website or application has a direct impact on how long customers will stay at your site and how likely they are to actually spend money.

![chapter1-image2.png](assets/chapter1-image2.png)

## Performance vs Load Testing
Performance and load testing are often grouped together, but they're actually quite different.

![chapter1-image3.png](assets/chapter1-image3.png)

When testing for performance we're testing the speed of an action or a set of actions on a single client or server instance. The most obvious example of this is page load time. That would be a performance test, but it's not a load test because it's only happening on the one single client.

For load testing, we're looking at the number of requests a service can handle in a given period of time.

## What are the factors that we need to consider when looking at client performance?
![chapter1-image4.png](assets/chapter1-image4.png)
 * **Network Conditions** - The way your website or application handles various network conditions is going to have the greatest impact on how people experience your application
 * **Resources Needed** - The _number of resources needed_ to load your webpage or to run your application is also a major factor, not just the quantity of resources but also the size
 * **Script Execution** - Whether there's a lot of scripts or if there's bugs in the scripts that are making them run slowly. Scripting can have a major effect on how responsive your application appears
 * **Image Rendering** - Image rendering on the browser of a mobile device is actually the most visible aspect of client performance and is definitely something that needs to be considered. If you have a lot of images or a complex set of images, it's going to take longer than something that's simple
 * **Server Performance** -  If your application is making an API call and that API call takes a long time, that of course it's going to affect the perceived speed of your application

## What do we need to look at with server performance?
![chapter1-image5.png](assets/chapter1-image5.png)
 * **Host Configuration** - This means how many boxes is the service running on? How much CPU do they have? How much memory do they have? Are they in the cloud? Are they co-located with the database? There's a lot of different aspects here to do with the configuration of the service and they can all have a major impact on the server performance
 * **Data Access** - Almost all services are working with data in some respect. If that data is in a database, does the service need to retrieve it every time or is it cached for faster access?
 * **Third party services** - If your service is working with a lot of third-party services or in a microservice environment, that can also have a big effect on the performance of your server
 * **Compute Requirements** - Of course, the core functionality of the service, what it's actually doing — the compute requirements. If you're doing a lot of complex algorithms or data management, that's going to take longer than just retrieving information and giving it back to the client.
 * **Client Load** - Your server might work great with one client attached to it, but when it has a million clients attached to it, it's going to be a lot more difficult for it to work in a speedy fashion.

![chapter1-image6.png](assets/chapter1-image6.png)

A well-performing client that's caching its resources and not depending on the back-end service for everything can reduce overall load and make the service itself faster.

And of course, the better a service performs, the more load it will be able to handle.

So, given the complexity of server performance and client performance and client load and how everything works together, it's really important to start thinking about your performance and load testing strategy as soon as possible in the test cycle. You don't want to be two weeks out from a major release and then realizing you don't even know if you're going to be able to handle the traffic that you're trying to get.

# 2 - Testing Web Clients
We'll start by looking at some tools that you can use in your browser to test both regular and mobile websites.
When we're using these tools, we want to look for:

**1. When the page is visible?**
When will the user know that something is actually happening on the web page?

**2. When is the page itself usable?**
When can somebody start entering things into a form? Things like that.

**3. How are resources being handled?**
Is there a large quantity of images? Or, are there very large images, or scripts that need to be downloaded?

**4. How much scripting is there?**
Are there a lot of different scripts going on? Are they blocking the main thread, so that the page is not usable while the scripts are running? Are there bugs in the scripts that are perhaps making them slower than they should be? These are all things to look at.

**5. Is the network usage being optimized?**
Is the site using a content delivery network so that the images are being sourced from a location that's closest to the client? And, if resources aren't immediately available, is the webpage able to handle that situation? Or, is it blocked? Another aspect of network usage is how many background requests are being made. This can include getting resources, API requests, any of that sort of thing.

## Chrome Developer Tools
When you're working with the Chrome Developer Tools, you want to start with an incognito window. This is so any ad blockers, or any other extensions you have on your regular browser don't interfere with the default workings of the website under test.

In order to get to the developer tools:
1. You can use the three-dot menu here (in the top right corner), and go to More Tools > Developer Tools;
2. Right Click > Inspect
3. CTRL + Shift + I

### Performance Tab
![chrome-dev-tools-performance-tab.png](assets/chrome-dev-tools-performance-tab.png)

To start with we're going to look at a website that actually is quite speedy, which is [etsy.com](https://etsy.com)

We can run an actual monitoring test by hitting the reload button here:
![chrome-dev-tools-reload.png](assets/chrome-dev-tools-reload.png)

Now, it's done and, we have a wealth of data to look at
#### Network
![chrome-dev-tools-performance-test.png](assets/chrome-dev-tools-performance-test.png)
This is where it's loading the main etsy.com page, and there are lines here that show you the interesting events

This is where it's loading the main etsy.com page, and there are lines here that show you the interesting events, and if you go to Timings, this timings thing we see things like FCP, LCP, DCL and L. These are the terms that Google is using to decide it's benchmarking.

* First Contentful Paint (FCP) - when the page first looks like something happens
* Largest Contentful Paint (LCP) - when the largest item it loaded in the browser
* Domain Content Loaded (DCL) - that's when the entire document model has been loaded into the browser
* L - Loaded

#### Timings
![chrome-dev-tools-performance-test.png](assets/chrome-dev-tools-performance-test-2.png)

#### Summary
![chrome-dev-tools-performance-test.png](assets/chrome-dev-tools-performance-test-3.png)

#### Investigating 1 Element - Picture Load
![chrome-dev-tools-performance-test.png](assets/chrome-dev-tools-performance-test-4.png)

### Lighthouse Tab
Options to run a report:
![Lighthouse.png](assets/Lighthouse.png)

Report running: 
![Lighthouse-2.png](assets/Lighthouse-2.png)

Report results:
![lighthouse-report.png](assets/lighthouse-report.png)

Diagnostics:
![lighthouse-report-diag.png](assets/lighthouse-report-diag.png)
Potential improvement ideas listed

## Page Speed Insights
The auditor that was in the tab is also available on its own web page called Page Speed Insights and this is actually running out of Google's Labs, and it will run the test on its own machines. It's a more consistent test than something that's subject to the vagaries of your own wireless network.

![page-speed-insights.png](assets/page-speed-insights.png)

**Report Output**
![page-speed-insights-report.png](assets/page-speed-insights-report.png)
This is a great way to look at a website, sort of a more neutral viewpoint than just maybe your own machine to get an idea of what's going on with it.

## WebPage Test 
WebPageTest - [webpagetest.org](https://webpagetest.org)

This is an open source site, and there's quite a lot you can do with this. We put in lingscars, and we can select our location. Instead of North America, we could actually select a location in Europe.
![webpagetest.png](assets/webpagetest.png)

Sometimes there a queue
![webpagetest-waiting.png](assets/webpagetest-waiting.png)

When the test is run we get a report
![webpagetest-report.png](assets/webpagetest-report.png)

## Quiz
**1. What does “First Contentful Paint” mean?**
    The first time a new page is visible to the user

**2. What is one way a CDN (Content Delivery Network) can help with performance?**
    By hosting content in various locations to better serve people in different places

**3. Which performance property can you profile with Chrome Developer Tools?**
* Frames per second
* Request response time
* Time spent running scripts

**4. How can scripts affect the performance of a web page?**
* By blocking further content loading
* By making additional network requests

**5. Tests on WebPageTest can be run on...**
    Real devices in various locations

## Resources
[Chrome Dev Tools](https://developers.google.com/web/tools/chrome-devtools/)
[Page Speed Insights](https://developers.google.com/speed/pagespeed/insights/)
[WebPageTest: Test a websites performance](https://www.webpagetest.org/)

# 3 - Mobile Testing
There are extra considerations on a mobile device
![chapter3-image1.png](assets/chapter3-image1.png)

First of all, the network conditions are even less reliable than with regular Wi-Fi and you have a variety of CPUs and memory and whether it's Android or iOS. There's a lot of different performance variables within the devices themselves.

Also, the more data you're downloading, your customers might actually be paying for that data. So, you have to be more cognizant of the quantity of images and scripts, etc, that you're downloading to each customer's device.

Finally, the battery life is very important. If you have very complicated images that are rendering, that costs a lot of battery for the devices.

## Chrome Developer Tools - Mobile
There's a button to toggle the website into mobile.
You can also select a mobile device to emulate - Let's say iPhone 12 Pro and we can choose if it's mid-tier etc to simulate mobile netwro.
![mobile-chrome-performance.png](assets/mobile-chrome-performance.png)

Now that we're in mobile mode, we can do another audit with Lighthouse, this time selecting mobile.
![mobile-chrome-lighthouse.png](assets/mobile-chrome-lighthouse.png)

Resulting report:
![mobile-chrome-lighthouse-report.png](assets/mobile-chrome-lighthouse-report.png)

## Page Speed Insights - Mobile
![page-speed-insights-mobile.png](assets/page-speed-insights-mobile.png)

## WebPageTest - Mobile
Can configure mobile device with 3G network
![webpagetest-mobile.png](assets/webpagetest-mobile.png)

Test Running
![webpagetest-mobile.png](assets/webpagetest-mobile-2.png)

Test Report
![webpagetest-mobile.png](assets/webpagetest-mobile-3.png)

## Android Studio Profiler
![chapter3-image3.png](assets/chapter3-image3.png)

Select option to _Profile or debug APK_
![android-studio.png](assets/android-studio.png)

Select an APK to test
![android-studio-apk.png](assets/android-studio-apk.png)

The first thing that Android Profiler is going to do is look at the size of the files on your APK.
This is very important for download times and Google actually has rules about how big APKs can be and also how much space you're taking up on the phone itself.
![android-studio-apk-profile.png](assets/android-studio-apk-profile.png)

Now that everything is here, You just push the Profiler button and select your connected device. Now, it's going to install the APK on your device.
You can see that we have CPU, memory, network, and energy.
Every time something happens, you can see the dot highlighted below.
You can watch this for certain spikes when things happen, if it's using too much CPU, too much energy, all that sort of thing, all available here.
![chapter3-image3.2.png](assets/chapter3-image3.2.png)

## Xcode Instruments

Apple provides similar tooling for iOS devices, except it's a little more complicated, of course, because it's iOS.

![chapter3-image4.png](assets/chapter3-image4.png)

You need to have an account that is a developer account with Apple and then you have to have a test application that's built using the development certificate.
You can use Xcode Devices window to load the test application and Xcode Instruments to begin profiling and it'll be very similar to the Android profiler.

## Device Statistics
Finally, you can actually just check your device while you're using application to monitor the resources that it's using.

![chapter3-image5.png](assets/chapter3-image5.png)
The battery usage, memory, mobile data usage, all of these things are available on either an Android or an iOS phone and they can be very useful for determining how an application is behaving.

## Quiz
1. **Chrome Dev Tools can emulate a 3G network on your laptop**
    True

2. **How do redirects cause issues for web page performance?**
   By increasing the total number of network calls


3. **WebPageTest can run tests on which device?**
   * Samsung Galaxy S7
   * iPhone SE
   * iPad Mini 2

4. **What has to be enabled on your Android device before profiling with Android Studio?**
   USB Debugging

5. **What profiling information is generally NOT available on a mobile device?**
    Request response speed


## Resources
[Android Studio](https://developer.android.com/studio)
[Instruments Help Topics](https://developer.apple.com/library/archive/documentation/AnalysisTools/Conceptual/instruments_help-collection/Chapter/Chapter.html)

# 4 - Load Testing Tools

## What are the things you want to think about when you're choosing a tool? 
**Open source versus commercial**
If your company already has a license for LoadRunner for example, that is probably the tool that you'll want to use. Whereas if you're just getting started, you might want to pick up an open source tool to begin with. And there's a lot of tools that you can start out open source and then move into an enterprise version of that same tool.

**Local versus cloud**
Are you expecting to run all of your test within your local network or are you outsourcing it to some kind of cloud provider that's going to do the running of the test and give you a report?

**UI vs Script**
Are you more comfortable with tool that has a UI or are you okay with writing a script for your tool in pure code? Something like JMeter which has a graphical interface might be better for somebody who's not as familiar with coding. But developers and other people who are comfortable with code might prefer Gatling or another tool where you can just write scripts directly.

**Integration with other development tools**
If you're in a Visual Studio environment, then it makes sense to use the Visual Studio load testing tool that's available.
Also, if there's already expertise in your company on a certain tool, then by all means leverage that expertise. So, I'm not going to recommend that you use one specific tool and that's the only tool to use. The important thing is to understand what's out there and understand what fits best into your situation.

## Demo using Restful Booker
Using a local instance of Restful Booker API: [Restful Booker API](https://restful-booker.herokuapp.com/)
Test Scenario: Frequent booking lookups and less frequent addition of new reservations

### JMeter
[JMeter Download Page](https://jmeter.apache.org/download_jmeter.cgi)

* GUI based tool written in Java
* First released in 1998
* Rich plugin ecosystem
* You can use JMeter for HTTP calls, FTP calls, web sockets, database, Redis. There's even a web driver plugin for Selenium. Basically, any way that a client and a server can communicate with each other, it's probably covered by a JMeter plugin. And if it's not, you can write your own plugin pretty easily if you're familiar with Java.
* Supports the Groovy scripting engine (scripty Java)
* Supports record & playback
* Supports distributed testing

#### Running JMeter
* Run `bin/JMeter.bat`

#### Setup JMeter for Demo
* Downloaded JMX file for course from [here](https://jmeter.apache.org/download_jmeter.cgi)
* Had to install [JMeter plugin manager](https://jmeter-plugins.org/get/) and put it in the ``lib/ext`` directory
* Got the `.jmx` file with the sample tests from [here](https://github.com/ambertests/tau_perf/blob/master/RestfulBooker.jmx) & saved it at `JMeter/RestfulBooker.jmx`

##### Plugins
Options > Plugins Manager

![jmeter-plugins.png](assets/jmeter-plugins.png)

#### Testing with JMeter
The way that works is you have a test plan & then you can create sort of local variables for your test plan & then you create these thread groups
![jmeter-env.png](assets/jmeter-env.png)
Each thread essentially represents a user and this particular thread group has a hundred users and it runs for 90 seconds. 
![jmeter-threadgroups.png](assets/jmeter-threadgroups.png)

And within this thread group I have these HTTP requests, which is going to the host and looking at the booking, getting it by name, id. So, any HTTP requests you can put together in one of these samplers or you could add more.
![jmeter-threadgroups-request.png](assets/jmeter-threadgroups-request.png)

This is how you add things and there are lots of options.

![jmeter-add.png](assets/jmeter-add.png)

Running the tests, output: 

_Response times over time_
![jmeter-running.png](assets/jmeter-running.png)

_Aggregate report_
![jmeter-running.png](assets/jmeter-running-2.png)

Running from the CLI
`` .\apache-jmeter-5.6.3\bin\jmeter.bat -t RestfulBooker.jmx -n -l rb_testresults.csv``
![jmeter-cli.png](assets/jmeter-cli.png)

Now that the test is completer we can review the results saved in the ``rb_testresults.csv`` file
![jmeter-load-results.png](assets/jmeter-load-results.png)

![jmeter-load-results-now.png](assets/jmeter-load-results-now.png)

### Gatling
* Scala-based tool
  * Scala is a scripting language that runs in the JVM
* First released in 2012
* Pure scripting interface
* Support record & playback
* More modern architecture can support a higher load than JMeter
* Enterprise version is available
* More info @ [https://gatling.io](https://gatling.io)

#### Setup
* Installed Scala plugin in IntelliJ
* Setup Scala SDK by downloading the one recommended in the plugin interface

#### Running Tests

Sample code located [here](https://github.com/ambertests/tau_perf/blob/master/RestfulBookerSimulation.scala)

Each of the objects is essentially the equivilant of a thread group in JMeter
````scala
/**
 * Copyright 2011-2017 GatlingCorp (http://gatling.io)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package restfulbooker

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class RestfulBookerSimulation extends Simulation {

  object Browse {
    val browse = repeat(100) {
      exec(http("get_all_bookings")
      .get("/booking"))
      .pause(300 milliseconds)
      .exec(http("get_by_name")
      .get("/booking?lastname=Smith"))
      .pause(250 milliseconds)
    .exec(http("get_by_id")
      .get("/booking/3"))
      .pause(425 milliseconds)
    }
  }

  object Book {
    val feeder = csv("rb_names.csv").random

    val book = repeat(20){
      feed(feeder)
      .exec(
        http("create_booking") // Here's an example of a POST request
        .post("/booking")
			  .body(StringBody(
          """{
              "firstname" : "${firstName}",
              "lastname" : "${lastName}",
              "totalprice" : 111,
              "depositpaid" : true,
              "additionalneeds" : "Breakfast",
              "bookingdates" : {
                "checkin" : "2013-02-23",
                "checkout" : "2014-10-23"
              }
            }""")).asJSON
      )
      .pause(5)
    }
  }

  val httpConf = http
    .baseURL("http://localhost:3001") // Here is the root for all relative URLs
    .acceptHeader("*/*") // Here are the common headers
    .contentTypeHeader("application/json")

  // val scn = scenario("Create and Find Bookings") // A scenario is a chain of requests and pauses
  //   .exec(http("get_all_bookings")
  //     .get("/booking"))
  //   .exec(http("get_by_name")
  //     .get("/booking?lastname=Smith"))
  //   .exec(http("get_by_id")
  //     .get("/booking/3"))
  //   .exec(http("create_booking") // Here's an example of a POST request
  //     .post("/booking")
	// 		.body(RawFileBody("RestfulBooker_create_request.txt")))

  val lookers = scenario("Lookers").exec(Browse.browse)
  val bookers = scenario("Bookers").exec(Book.book)

  setUp(
    lookers.inject(rampUsers(100) over (30 seconds)),
    bookers.inject(rampUsers(30) over (10 seconds))
  ).protocols(httpConf)

  // setUp(scn.inject(atOnceUsers(1)).protocols(httpConf))
}
````

**Output report**

![chapter4-image8.png](assets/chapter4-image8.png)

### Generating Load
Once you have your script figured out, of course the idea is to run a lot of instances of your scripts so you can generate hundreds, thousands, maybe even millions of users for your application.

![chapter4-image9.png](assets/chapter4-image9.png)