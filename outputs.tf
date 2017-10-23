output "policy" {
  value = "${data.aws_iam_policy_document.get_sshkeys.json}"
}

output "role" {
  value = "${aws_iam_role.pull_sshkeys.name}"
}

output "instance_profile" {
  value = "${aws_iam_instance_profile.pull_sshkeys.name}"
}
