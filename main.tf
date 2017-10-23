data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "pull_sshkeys" {
  name               = "${var.role_prefix}-role"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

resource "aws_iam_instance_profile" "pull_sshkeys" {
  name = "${var.profile_prefix}-ip"
  role = "${aws_iam_role.pull_sshkeys.name}"
}

data "aws_iam_policy_document" "get_sshkeys" {
  statement {
    actions = [
      "iam:GetGroup",
      "iam:GetUser",
      "iam:ListGroups",
    ]

    resources = [
      "arn:aws:iam::*:group/*",
    ]
  }

  statement {
    actions = [
      "iam:GetUser",
      "iam:ListGroups",
      "iam:GetSSHPublicKey",
      "iam:ListSSHPublicKeys",
      "iam:ListUsers",
    ]

    resources = [
      "arn:aws:iam::*:user/*",
    ]
  }
}

resource "aws_iam_role_policy" "get_sshkeys" {
  name   = "get_sshkeys"
  role   = "${aws_iam_role.pull_sshkeys.id}"
  policy = "${data.aws_iam_policy_document.get_sshkeys.json}"
}
