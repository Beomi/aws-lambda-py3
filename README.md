# aws-lambda-py3

## Pre compiled python3 packages for AWS Lambda

This repo was made by inspire with [ryfeus](https://github.com/ryfeus)'s [lambda-packs](https://github.com/ryfeus/lambda-packs)

## Function configures

- Runtime: Python3.6
- Handler: lambda_function.lambda_handler (default)

> Handler means `python_file_name.function_name`

## Supporting packages

- requests + bs4
- requests + bs4 + lxml

## How to use

### (Easy) Case1: All you need is here & just want to edit python file only.

- Clone this repo or Download with zip file.
- Enter package named directory which you want to use.
- Unpack `pack.zip` to `pack` directory.
- Edit function `lambda_handler` in python file named `lambda_function.py`.
- Zip all **FILES**(remember NOT directory!) in `pack` folder.
- Upload zipped files to AWS Lambda function.
- Save lambda function, and you're good to go!

> You don't have to care about other files... like `*.sh` files.

### (Hard) Case2: Need more packages or use custom data structure.

You need `docker` to compile your own packages to build with.

- Download [Docker Community Version](https://store.docker.com/search?type=edition&offering=community) and install on your computer
- Edit your python file(`lambda_function.py`) and add your other python files beside `lambda_function.py`.
- Update requirements.txt with your package lists.
- run `chmod +x mkPack.sh`
- run `./mkPack.sh`
- Your `pack.zip` will be there.
- (if `pack.zip` is smaller than 50MB) Upload `pack.zip` to AWS Lambda function.
- (if `pack.zip` is bigger than 50MB) Upload `pack.zip` to AWS S3, and copy s3 link(starts with `https://`) and paste to AWS Lambda function.
- Save Lambda, and you're good to go!

> Note: you can change `mkPack.sh` file to use docker container again. (not to run & update container everytime you build your code.)

## Limitations

### Zipped code file size limit

Currently, AWS Lambda doesn't support uploading zip file bigger than 50MB directly on lambda generate site. But you can still upload zipped file to S3 bucket and link it to Lambda function.

### Unzipped code file size limit

AWS Lambda doesn't support (unzipped) codes bigger than 250MB. This is HARD-limit, so if you want to run codes with lambda then you have to make your code size lesser than 250MB.

### OS limit

AWS Lambda OS based on latest Amazon Linux AMI, so you have to compile with that AMI.

In this repository I've precompiled packages with Amazon Linux docker container.

### Memory limit

You can use system memory upto 3GB(3000MB).

And process performance is higher accordingly.

### Time limit

You can run 1 lambda function upto 5min(600s), if your work last more than 5min, consider to use spot instance EC2.

### Limit of simultaneity

You can run lambda functions upto 1000 at a time. But this is soft limit so you can increase with AWS issue ticket.

## Packages

### requests + bs4

#### Description

Package for crawling static HTML with requests & parsing HTML with BeautifulSoup.

Demo code returns first result's title from google search.

Sample Event: 

```python
# Sample
## Input Event object
{
  "keyword": "linear+algebra"
}

## Return value
{
  "title": "선형대수학 - 위키백과, 우리 모두의 백과사전"
}
```

#### Packages version

- requests 2.18.4
- beautifulsoup4 4.6.0 (with bs4 0.0.1)

#### Suggested Configure

- Memory: 128M (minimum)
- Timeout: 5s

### requests + bs4 + lxml

#### Description

Package for crawling static HTML with requests & parsing HTML with BeautifulSoup and lxml.

Demo code returns first result's title from google search.

Sample Event: 

```python
# Sample
## Input Event object
{
  "keyword": "linear+algebra"
}

## Return value
{
  "title": "선형대수학 - 위키백과, 우리 모두의 백과사전"
}
```

#### Packages version

- requests 2.18.4
- beautifulsoup4 4.6.0 (with bs4 0.0.1)
- lxml 4.1.1

#### Suggested Configure

- Memory: 128M (minimum)
- Timeout: 5s
