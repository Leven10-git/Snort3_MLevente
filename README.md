# Monitor Application Access by Grafana using Snort3

Run Snort3 inside a conatiner in order to check the access of web applications on the UI.

![image](https://user-images.githubusercontent.com/68270364/145672764-e88598a2-9ecb-4fe8-806e-eb5dcd7042ef.png)


The Alerts are processed by a custom build API, which passes the information from Snort3 to Grafana. 

```
def app_lookup(application):
    AppList = []
    aList= [""]
    print("Started Reading JSON file which contains multiple JSON document")
    with open('/var/log/snort/appid.json') as f:
        for jsonObj in f:
            AppDict = json.loads(jsonObj)
            AppList.append(AppDict)
    nb=0
    print("Printing each JSON Decoded Object")
    for app in AppList:
        if app["dns_host"] != None and application in app["dns_host"]:
            nb+=1
    aList ={'pkt_time':application , 'number_accessed':nb}
    return (aList)
    f.close()
```
The Application pulls the three custom docker images: Snort3, Snort3_Grafana and Snort3_API.
The Network interface is passed as the single parameter, and the appliction will be ready.

Snort3_API request are using the port 5000, they look like: 
```
{"number_accessed":44,"application":"google"}
```

Grafana can be accessed on port 3000. 
These port needs to open on localhost. 

Clone the current Git repository, and run the application: 
```
./automate.sh <network_interface_name> 
```

Created and maintained by Levente Manases. 
