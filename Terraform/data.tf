data "template_file" "user_data" {
    template = file("./resources/userdata.tpl")
}