

# ML.NET with MongoDB 

This repository is based on [dotnet: machine-learning tutorials - Sentiment Analysis](https://github.com/dotnet/samples/tree/master/machine-learning/tutorials/SentimentAnalysis). This is a modified version that uses MongoDB as a data source.


## Setup: Docker

A Dockerfile is included in this repo to help setup the environment. The Dockerfile is based on Ubuntu 18.04 image with `.NET Core` version 2.1. By default the project will be built using [MongoDB C#/.NET driver](http://mongodb.github.io/mongo-csharp-driver/) version 2.7.0. 

Note that the given code example has been tested only against the default MongoDB Driver version. There is no guarantee that the code sample will work for all possible versions of the driver.

### Build Steps

1. Build Docker image with a tag name. After cloning this repository, in the root directory execute:
      
    ```
    docker build . -t mlnet_mdb
    ```

2. Run the Docker image by executing:

   ```
   docker run -tih mlnet mlnet_mdb
   ```
   The command above will run a Docker image with tag `mlnet_mdb` and provide it with `mlnet` as its hostname.

### Execution Steps

Run the compiled C# code example by following below steps:

   * `cd ~/sentiment`
   * `dotnet build`
   * `dotnet run`

By default the code will read from a MongoDB Atlas M0 shared instance (lowest spec instance, hosted in AWS Virginia USA). Please take this into consideration in terms of latency and performance. 


## Setup: Data

In the [data](./data) directory, you can find two example dataset in JSON format. You can load these files into any MongoDB deployment using `mongoimport`. For example: 

```sh
mongoimport --uri "mongodb+srv://user:pwd@dataset-zh.mongodb.net/yelp" --collection review_train ./review_train.json 
mongoimport --uri "mongodb+srv://user:pwd@dataset-zh.mongodb.net/yelp" --collection review_test ./review_test.json 
```





