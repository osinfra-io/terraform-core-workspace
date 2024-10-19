# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/198844818-02e68cb6-f6cc-4747-bf38-cd458a133628.png"> Terraform Core - Workspace Terraform Module

**[GitHub Actions](https://github.com/osinfra-io/terraform-core-workspace/actions):**

[![Terraform Tests](https://github.com/osinfra-io/terraform-core-workspace/actions/workflows/test.yml/badge.svg)](https://github.com/osinfra-io/terraform-core-workspace/actions/workflows/test.yml) [![Dependabot](https://github.com/osinfra-io/terraform-core-workspace/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/terraform-core-workspace/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/00c5bd62-c59f-44f6-8583-5632a43182fd/branch/65062ab7-4e16-4e82-ba22-22c03a84f6fc)](https://dashboard.infracost.io/org/osinfra-io/repos/00c5bd62-c59f-44f6-8583-5632a43182fd?tab=settings)

💵 Monthly estimates based on Infracost baseline costs.

## Repository Description

Terraform **example** module for extracting workspace information.

> [!NOTE]
> We do not recommend consuming this module like you might a [public module](https://registry.terraform.io/browse/modules). It is a baseline, something you can fork, potentially maintain, and modify to fit your organization's needs. Using public modules vs. writing your own has various [drivers and trade-offs](https://docs.osinfra.io/fundamentals/architecture-decision-records/adr-0003) that your organization should evaluate.

## 🔩 Usage

> [!TIP]
> You can check the [tests/fixtures](tests/fixtures) directory for example configurations. These fixtures set up the system for testing by providing all the necessary initial code, thus creating good examples on which to base your configurations.

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [checkov](https://github.com/bridgecrewio/checkov)
- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

### 🔍 Tests

All tests are [mocked](https://developer.hashicorp.com/terraform/language/tests/mocking) allowing us to test the module without creating infrastructure or requiring credentials. The trade-offs are acceptable in favor of speed and simplicity. In a Terraform test, a mocked provider or resource will generate fake data for all computed attributes that would normally be provided by the underlying provider APIs.

```none
cd fixtures/default
```

```none
terraform init
```

```none
terraform test
```

## 📓 Terraform Documentation

> A child module automatically inherits default (un-aliased) provider configurations from its parent. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGIN_TF_DOCS -->
### Requirements

No requirements.

### Providers

No providers.

### Modules

No modules.

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository"></a> [repository](#input\_repository) | The repository name | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input\_team) | The team name | `string` | n/a | yes |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | This is used for tests to set the workspace name. Do not set this variable in any other context | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment"></a> [environment](#output\_environment) | n/a |
| <a name="output_labels"></a> [labels](#output\_labels) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_zone"></a> [zone](#output\_zone) | n/a |
<!-- END_TF_DOCS -->