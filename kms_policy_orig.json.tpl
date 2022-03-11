{
    "Version": "2012-10-17",
    "Id": "key-consolepolicy-2",
    "Statement": [
      {
        "Sid": "Enable IAM policies",
        "Effect": "Allow",
        "Principal": {"AWS": "arn:aws:iam::${account_id}:root"},
        "Action": "kms:*",
        "Resource": "*"
      },
      {
        "Sid": "Allow access for Key Administrators",
        "Effect": "Allow",
        "Principal": {"AWS": [
          "arn:aws:iam::111122223333:user/KMSAdminUser",
          "arn:aws:iam::111122223333:role/KMSAdminRole"
        ]},
        "Action": [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion"
        ],
        "Resource": "*"
      },
      {
        "Sid": "Allow use of the key",
        "Effect": "Allow",
        "Principal": {"AWS": [
          "arn:aws:iam::111122223333:user/ExampleUser",
          "arn:aws:iam::111122223333:role/ExampleRole",
          "arn:aws:iam::${account_id}:root"
        ]},
        "Action": [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        "Resource": "*"
      },
      {
        "Sid": "Allow attachment of persistent resources",
        "Effect": "Allow",
        "Principal": {"AWS": [
          "arn:aws:iam::111122223333:user/ExampleUser",
          "arn:aws:iam::111122223333:role/ExampleRole",
          "arn:aws:iam::${account_id}:root"
        ]},
        "Action": [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ],
        "Resource": "*",
        "Condition": {"Bool": {"kms:GrantIsForAWSResource": "true"}}
      }
    ]
  }