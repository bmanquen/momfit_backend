require 'aws-sdk-s3'

Aws.config.update({
                    region: 'us-east-2',
                    credentials: Aws::Credentials.new(ENV.fetch('AWS_ACCESS_KEY', nil),
                                                      ENV.fetch('AWS_SECRET_KEY', nil))
                  })
