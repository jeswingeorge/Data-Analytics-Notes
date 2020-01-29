# Introduction to Azure Databricks

Data is growing at an exponentially faster rate which mandates the requirement for an environment where the big data can be processed efficiently. 
Microsoft offers several services to process and orchestrate big data. Some of the services are:

- __Azure HDInsight__ - deploys and provisions hadoop clusters on Azure.
- __Azure Stream analytics__ - provides real time analytics on data from apps, devices, sensors, etc.
- __Azure Data Factory__ - allows the integration of disparate data sources.
- __Azure Data Lake__ - is a big data repository and analytics platform.

All these services can be used to handle big data but integration of these services with any data sources is not possible. 
For example, the data sources for Azure HDInsight is only blob storage and datalake store, the input for stream analytics
are only Azure services like blob storage, event hubs, etc. Azure Data Lake analytics can be performed only with the data 
that is stored in Azure datalake store. This limitation can be overcome with the help of Azure Databricks. Azure Databricks
allows your data to get connected to various data sources like Azure storages, Cassandra, Elasticsearch, Redis, Couchbase, etc.

You will now understand what Azure Databricks is.

***

Microsoft in collaboration with Databricks have come up with the service named Azure Databricks. This platform helps to set up
the Spark environment quickly where data scientists and analysts can perform analytics, orchestrate data by building pipelines 
and also create predictive models using machine learning. Azure Databricks also has the capability to connect to wide range of data sources.

The following illustration shows the placement of Databricks in the Azure topology.

[](img1.PNG)

Datascientists, engineers and other LOB folks can directly interact with Azure Databricks. Azure Databricks is one single plaform
where storage, processing, ETL and visualization can be done.

Clusters of machines are managed by the Databricks and the Databricks Runtime is nothing but a set of software artifacts that you
can use to run on Databricks.

__DBIO (Databricks I/O)__ is a package that provides transactional writes to cloud storage for Spark jobs.

__Databricks Serverless__ provides the features to make use of the full power of Apache Spark.

__Database Enterprise Security (DBES)__ is an in depth security model that provides the most advanced protection of the data.


Some of the benefits of Azure Databricks are as follows

- Single platform for diverse users

Azure Databricks provides a common platform for data engineers to capture and process data. It allows data scientists 
to build predictive models and perform advanced analytics. It enables business analysts to write queries and visualize the data. 

- Connectivity to wide data sources

Azure Databricks connects to various data sources like Azure blob storage, Azure data lake store, SQL Database, SQL Datawarehouse
and Cosmos DB. It can also be connected to Event hubs and Kafka to collect streaming data.

- Perform variety of compute tasks

Azure Databricks provides a wide variety of compute tasks through a single service. Compute tasks like batch ETL jobs, stream processing,
machine learning, and data visualization/exploration can be done on a single platform.

Azure Databricks is a services that is specifically used to build Spark environment. Before we start with Apache Spark, it is important 
that you understand the Spark concepts.

#### Overview of Apache Spark

Apache Spark is an open source tool for processing big data which leverages in-memory capability thus providing faster processing
 and good performance. Spark has the capability to process huge volume of data in short span of time.

Some of the advantages of Spark over Hadoop are:

- The processing time for Spark is 100 times faster than the Hadoop's Map Reduce.

- Spark uses comparatively fewer resources than Hadoop thus making Spark cost effective.

- Spark can run on Hadoop or standalone or cloud but Map Reduce is compatible only on Hadoop.

- Spark has APIs in languages such as Scala, Java and Python unlike Hadoop which is more tied with Java.

Now that you understand what Spark is, you will now explore the Spark ecosystem.

#### Spark Ecosystem

The following diagram shows the Spark ecosystem.

[](img2.PNG)

__Spark SQL + DataFrames__: is used for working with structured data. A distributed collection of data that is organized into named columns is referred as DataFrames.

__Streaming__: is used for processing and analyzing real-time data.

__MLlib__: is a machine learning library that contains certain learning algorithms like classification, clustering, regression, etc.

__GraphX__: is used in cognitive analytics for data exploration.

__Spark Core API__: is used to work on large datasets using languages such as R, SQL, Python, Scala, and Java.

Now that you have seen the ecosystem of Sparks, you will now see the various ways to handle the data that is going to be used for performing analytics on Spark.


#### Aspects of Apache Spark

Following are some of the APIs for processing the big data.

__Dataframes__ - is a collection of data that are organized in a column format. It can be Hive tables, existing RDDs, external databases or any structured files.

__Datasets__ - Dataset is a data structure in Spark SQL where in it is strongly typed and it is mapped to a relational schema. It represents structured queries and is an extension to data frame API. 

__RDD__ - stands for Resilient Data Distribution and it is an immutable collection of distributed objects. RDDs can be present in different nodes of the cluster.

__Structured streaming__- is a scalable and fault-tolerant stream processing engine built on the Spark SQL engine for handling real time data.

You will now look at several real life scenarios before looking into the architecture of Databricks.



#### Azure Databricks Architecture

Following diagram illustrates Databricks architecture

[](img3.PNG)

- Databricks is a centralized managed service from the Azure control center where no additional set up is required.

- When a cluster is launched by the user via Databricks, an Azure Resource Manager (ARM) template is deployed as an Azure resource in the user's subscription.

- The user specifies type of VMs and number of VMs. Databricks control plane manages creation and deletion of VMs.

- In addition to these resources, in the user's subscription, a managed resource group is deployed that contains a VNet, a security group, and a storage account.

- Azure Databricks UI enables the users to manage the Databricks cluster.

- The scheduled jobs are stored in an Azure Database with geo-replication for fault tolerance.

- Azure blob storage can be used to persist the files in DBFS (Databricks File System) which ensures that user won’t lose data even after cluster termination.

- Databricks Workspace stores notebooks, libraries, and dashboards.

- Databricks Runtime manages the various components, then it updates them substantially to improve the usability, performance, and security of big data analytics.

#### Databricks concepts

You will now understand the fundamental concepts and terminologies related to Azure Databricks. Databricks concepts are mainly divided into 5 categories:

- Workspace

- Data management

- Computation management

- Model management

- Authentication and Authorization

You will first understand Databricks Workspace.

##### 1. Workspace

__Workspace__: A workspace is the root folder for Azure Databricks. Workspace stores notebooks, libraries, and dashboards.

__Databricks File System – DBFS__: is a distributed file system that is installed on Databricks Runtime clusters. The files that are present
 in DBFS persist to Azure Blob storage which ensures that you won’t lose data even after you terminate a cluster.

__Notebooks__: is a document that contains runnable code. Notebooks is an interface for interacting with Azure Databricks.

__Library__: is nothing but a package of code available to the execution context running on your cluster. Libraries can be in Python, Java, Scala,
 and R. You can also add your own package.

__Dashboards__: Dashboard allow you to publish graphs and visualizations derived from notebook output and share them in a presentation format 

__Visualization__: A graphical rendering of table data and the output of notebook commands.

__Databricks Runtime__: Databricks Runtime is the set of core components that run on the clusters managed by Azure Databricks. Apache 
Spark is an example. It also includes a number of components and updates them substantially to improve the usability, performance, and
 security of big data analytics.

##### 2. Data management objects in Azure Databricks

Data management is nothing but something that describes the objects that hold the data on which one can perform analytics and finally feed 
into machine learning algorithms.

__Database__: is a collection of organized information that can be easily accessed, managed, and updated.

__Table__: is a collection of structured data. This is equivalent to Apache Spark DataFrames. One can cache, filter, and perform any operations
 supported by DataFrames on tables. The tables can be queried with Spark APIs and Spark SQL.  

__Delta tables__: Databricks Delta delivers a powerful transactional storage layer by leveraging the Apache Spark and Databricks DBFS. The core 
abstraction of Databricks is that it:

- Stores data as Parquet files in DBFS.

- Maintains a transaction log that efficiently tracks changes to the table.


##### 3. Computation and Model management

Computation management talks about the concepts to run analytics workload and machine learning computations.

__Cluster__: provide a unified platform for running ETL pipelines, streaming analytics, ad-hoc analytics, and machine learning. There are 2 types of clusters in Azure Databricks: interactive and job. Interactive clusters analyze data collaboratively with interactive notebooks whereas a job cluster run fast and robust automated workloads.

__Model Management__: Model management describes concepts that build machine learning models.

__Model__ serves as the framework to train machines to make predictions. The initial structure imposed upon a function.

__Trained Model__ is the outcome of training process. It is the mapping from input to output.


##### 4. Authentication and Authorization

Authentication and Authorization describes how to manage Azure Databricks users and their access to Azure Databricks workspace objects.

__User__ is a  unique individual who has access to the system.

__Group__ is a collection of users.

__Access control list__ refers to the list of permissions associated to the Workspace, cluster, job, or table. 


***


## Create Databricks and launch workspace

#### What are Spark jobs?

Any analytics that needs to be done on the Spark can be done through the notebooks. The notebooks can accomodate Scala, Python or SQL. The notebooks can then be executed immediately or scheduled to get executed using jobs. 

In Azure Databricks, the following steps should be followed for performing analytics

1. Create Azure Databricks service

2. Launch workspace

3. Create cluster

4. Create notebooks using Scala

5. Execute the notebook

You will now see how to execute the above the steps.

As first step, you will now create Azure Databricks service.


#### Create Azure Databricks


Images

You are not allowed to create a cluster under the free credit trial. It will ask to pay as you go subscription.

#### Launch Azure Databricks workspace and create cluster






























