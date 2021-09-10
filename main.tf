provider "aws" {
  version    = "~> 3.0"
  region     = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "homepage" {
  source  = "app.terraform.io/moonandbeyond/s3website/aws"
  version = "v0.1.2"

  bucket_name = "moon-and-beyond-money-machine-gh-actions-${var.env}"
  website = {
    index = "index.html"
    error = "error.html"
  }

  manifest = {
    "index.html" = <<EOF
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <title>Moon and Beyond</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">

  <link rel="manifest" href="site.webmanifest">
  <link rel="apple-touch-icon" href="icon.png">
  <!-- Place favicon.ico in the root directory -->

  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style.css">

  <meta name="theme-color" content="#fafafa">
</head>

<body>

  <!-- Add your site or application content here -->
  <img src="${var.image_src}" >
  <p>Make money, buy crypto</p>
  <p>Running on <strong>${var.env}</strong></p>

</body>

</html>
  EOF

    "error.html" = <<EOF
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <title>Moon and Beyond</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">

  <link rel="manifest" href="site.webmanifest">
  <link rel="apple-touch-icon" href="icon.png">
  <!-- Place favicon.ico in the root directory -->

  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style.css">

  <meta name="theme-color" content="#fafafa">
</head>

<body>

  <!-- Add your site or application content here -->
  <img src="https://i.imgur.com/sohWhy9.jpg" />
  <p>Error on <strong>${var.env}</strong></p>

</body>

</html>
  EOF
  }

  tags = {
    env   = var.env
    trial = "2"
  }
}
