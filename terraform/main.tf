# Tell terraform we need the "kind" provider (plugin to create the kind clusters)
terraform {
    required_providers{
        kind={
            source= "tehcyx/kind"

        }
    }
}

# configure the kind provider(defaults are fine)
provider "kind" {}

# Declare the infrastructure we want to exist: a kubernetes cluster
resource "kind_cluster" "spotify" {
  name="spotify-iac"
  wait_for_ready=true
}