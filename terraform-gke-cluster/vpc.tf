# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

provider "google" {
credentials = file("C:\\Users\\narrareddy\\Terraform\\harsha-test-392010-60d8c3398e65.json")
project     = var.project_id  // specify your project id
region      = var.region // specify region
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "cluster-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "cluster-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
