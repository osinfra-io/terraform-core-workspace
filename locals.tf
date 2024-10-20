# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  # The regex is used to parse the workspace name into its components, the components are used to set the region, zone, and environment variables.
  # This requires structured workspace names, the structured workspace names are defined by the regex.

  # Examples:
  # main-sandbox -> region = null, zone = null, environment = sandbox
  # us-west1-sandbox -> region = us-west1, zone = null, environment = sandbox
  # us-west1-foo-sandbox -> region = us-west1, zone = null, environment = sandbox
  # us-west1-a-sandbox -> region = us-west1, zone = a, environment = sandbox
  # us-west1-a-foo-sandbox -> region = us-west1, zone = a, environment = sandbox

  environment_regex = "-(non-production|sandbox|production)$"
  region_regex      = "^(us-[a-z]+\\d+)"
  zone_regex        = "^us-[a-z]+\\d+-([abcd])"

  env = local.environment != null ? lookup(local.env_map, local.environment, "none") : null

  env_map = {
    "non-production" = "nonprod"
    "production"     = "prod"
    "sandbox"        = "sb"
  }

  environment = local.parsed_workspace.environment

  labels = {

    # Datadog expects the label env for unified service tagging

    env                 = local.environment
    cost-center         = var.cost_center
    data-classification = var.data_classification
    email               = var.email
    region              = local.region
    repository          = var.repository
    team                = var.team
    zone                = local.zone != null ? "${local.region}-${local.zone}" : local.region
  }

  parsed_workspace = (
    local.workspace == "default" ?
    {

      # We use mock providers when testing Terraform child modules, these values align with the test naming conventions

      environment = "mock-environment"
      region      = "mock-region"
      zone        = "mock-zone"
    } :
    {
      environment = try(regex(local.environment_regex, local.workspace)[0], null)
      region      = try(regex(local.region_regex, local.workspace)[0], null)
      zone        = try(regex(local.zone_regex, local.workspace)[0], null)
    }
  )

  region = local.parsed_workspace.region


  workspace = var.workspace != null ? var.workspace : terraform.workspace
  zone      = local.parsed_workspace.zone
}
