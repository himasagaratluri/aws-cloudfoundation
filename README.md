### CloudFoundation

The repo holds code to build your aws base infrastructure to support your app/business

There are different modules included.
 * ci-cd: where you have code to deploy and manage tools related to CI-CD
   * jenkins
   * artifactory
 * networking: code to manage network for your cloud env.
   * subnets
   * vpc
 * security: code to manage security.
   * iam: roles, users and policies
   * waf: firewall rules
 * configuration-management: managing code to config vms etc.
   * ansible


IAC: Infra Structure as a Code

Common options that work with AWS are:
  > Terraform (cloud-native)
  > CloudFormation (aws-native)
  > etc..