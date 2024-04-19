require 'aws-sdk-s3'

class UploadFileController < ApplicationController
  def upload
    s3 = Aws::S3::Resource.new
    bucket_name = Rails.env == 'production' ? 'momfit' : 'momfit-dev'
    obj = s3.bucket(bucket_name).object(params[:file].original_filename)
    obj.upload_file(params[:file].tempfile, acl: 'public-read')
    image_url = obj.public_url.to_s
    render json: {message: 'File uploaded successfully', imageUrl: image_url}, status: :ok
  end
end
