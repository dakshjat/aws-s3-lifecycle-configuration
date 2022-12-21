# Terraform Amazon S3 Lifecycle Configuration
### Amazon Simple Storage Service (Amazon S3) Lifecycle Configuration using Terraform

![Architecture Diagrams](https://user-images.githubusercontent.com/47545538/208871708-aec4f8ee-6ce0-44c2-a0f1-35f892b98ff8.jpeg)
Use Terraform IaC Amazon S3 modules to create an Amazon S3 lifecycle configuration.

Terraform includes the below set of resources using the modules:
* Amazon S3 bucket
* AWS KMS for Amazon S3 bucket encryption
* Amazon S3 bucket versioning
* Amazon S3 bucket lifecycle configuration

___

Use the following commands to build, change and destroy AWS infrastructure using Terraform:
* To initialize a working directory containing Terraform configuration files:

<pre><code>terraform init</pre></code>

* To create an execution plan, which lets you preview the changes to your infrastructure:

<pre><code>terraform plan -var-file="<b><i>variable_definitions_file</b></i>"</pre></code>
<pre><code>terraform plan -var-file="sandbox.tfvars"</pre></code>

* To execute the actions proposed in a Terraform plan:
<pre><code>terraform apply -var-file="<b><i>variable_definitions_file</b></i>" -auto-approve</pre></code>
<pre><code>terraform apply -var-file="sandbox.tfvars" -auto-approve</pre></code>

* To destroy all remote objects managed by a particular Terraform configuration:
<pre><code>terraform destroy -var-file="<b><i>variable_definitions_file</b></i>" -auto-approve</pre></code>
<pre><code>terraform destroy -var-file="sandbox.tfvars" -auto-approve</pre></code>

For more information on Amazon S3 Managing lifecycle, visit [Managing lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html).

For more information on Terraform S3 lifecycle configuration, visit [Terraform Resource: aws_s3_bucket_lifecycle_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration).