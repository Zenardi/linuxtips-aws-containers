#### GENERAL CONFIGS ####
variable "project_name" {
    description = "Nome do projet. Essa variável será um prefixo para os recursos criados dentro desse projeto"
    default = "linuxtips"
}

variable "region" {
    description = "Região da AWS onde os recursos serão criados"
    default = "us-west-2"
}