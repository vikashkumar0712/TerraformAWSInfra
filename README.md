# You also want to deployment your Static Website using terraform? Let's come with me.
## Prerequiesites 
- terraform installed
- aws cli installed
- basic knowledge of terraform
- basic knowledge of s3 and cloudfront
  You have all these good to go

## Clone This repo and go into the folder
```
git clone https://github.com/vikashkumar0712/TerraformAWSInfra/
cd TerraformAWSInfra
```
## Authenticate the Credentials to terraform 
### Step 1: Create CLI Credentials in aws if don't know folloe this doc:https://docs.aws.amazon.com/singlesignon/latest/userguide/howtogetcredentials.html
### Step 2: Run Following command
```
aws configure
```
#### Just enter your Access key and secret access key and leave all thing defualt.
![image](https://github.com/vikashkumar0712/TerraformAWSInfra/assets/89198300/a191db1a-004c-41ce-aee8-efba666bb646)

## Let's start Resource making
### Step 1: Comment the terraform block in providers.tf you can create manually if you want just remove backend.tf file.
![image](https://github.com/vikashkumar0712/TerraformAWSInfra/assets/89198300/ce2edae2-6e7d-4a10-a18e-9378a3ff59a1)

### Step 2: Check what will create after apply then apply
##### Don't forgot to change variable names
```
terraform init
terraform plan
terraform apply --auto-approve
```
NOTE: I have used --auto-approve flag which is not recommended in Production environment if you are deploying in crucial environment just run terraform apply.
### Step 3: Now it's time to migrate the Terraform backend and state lock 
#### Uncomment the code which you have commented in step 1.
#### Re initialize the terraform by running this command
```
terraform init
```
#### Terraform ask you to copy the existing statefile to remote backend just Enter "Yes" you will see a Success Message
![image](https://github.com/vikashkumar0712/TerraformAWSInfra/assets/89198300/dd208dc9-a0a6-4e9c-815c-c27194190d71)

### Step 4: Upload the Website files to your S3 bucket ucing cli or aws console.

### Now you can Access your website.
![image](https://github.com/vikashkumar0712/TerraformAWSInfra/assets/89198300/27130d51-c59d-4f08-bdf8-3ce284608a79)

## Troubleshooting
#### In case you face any Access denied(403) or not found (404) error This can be occur due to several OAI present in your account and cloudfront is enable to pick one.

- Go to ClouFront console
- go to Origin tab
- select the origin and click edit
- reselct the origin bucket
- in origin access choose "Legacy access identities"
- and choose your OAI
- Save

#### If you encounter any other issue feel free to react me out 
Linkedin: https://www.linkedin.com/in/mrvikash07
mail: vikashkumar07844@gmail.com







