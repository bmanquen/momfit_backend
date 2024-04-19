require 'aws-sdk-s3'

Aws.config.update({
  region: 'us-east-2',
  credentials: Aws::Credentials.new('AKIATWE7R74AT6AM7XPE', '3UfyinEBw9iYt+7p8k9kP1j4UQJct4SQDQE1D6wc')
})
