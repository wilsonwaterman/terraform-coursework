terraform {
    backend "s3" {
        bucket  = "terraform-course-state-storage"
        key     = "terraform/demo4"
        region  = "us-west-2"
    }
}