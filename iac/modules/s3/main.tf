resource "aws_s3_bucket" "react_app" {
  bucket = "react-app-${var.environment}-fullstacks-2025"

  tags = {
    Name        = "react-app-${var.environment}-fullstacks-2025"
    Environment = "${var.environment}"
  }
}

resource "aws_s3_bucket_public_access_block" "react_app" {
  bucket = aws_s3_bucket.react_app.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "react_app" {
  bucket = aws_s3_bucket.react_app.id
  policy = data.aws_iam_policy_document.react_app.json
}

data "aws_iam_policy_document" "react_app" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.react_app.arn,
      "${aws_s3_bucket.react_app.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "react_app" {
  bucket = aws_s3_bucket.react_app.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
