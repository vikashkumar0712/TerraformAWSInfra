// OAI Creation

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for S3 bucket access via CloudFront"
}

// Bucket Policy

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.web-hosting-bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "s3:GetObject",
        Effect = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        },
        Resource = "${aws_s3_bucket.web-hosting-bucket.arn}/*",
      },
    ],
  })
}

// Cloudfront Destribution

resource "aws_cloudfront_distribution" "website_distribution" {
  origin {
    domain_name = "portfolio-hosting-vikash.s3.amazonaws.com" # Replace with your S3 bucket's domain name
    origin_id   = "S3-${aws_s3_bucket.web-hosting-bucket.id}"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
      
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    target_origin_id       = "S3-${aws_s3_bucket.web-hosting-bucket.id}"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none" # Allow access from all locations
    }
  }


    
}