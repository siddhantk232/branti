module CoverImage
  extend ActiveSupport::Concern

  included do
    include ImageUploader::Attachment(:cover_image)
  end
end
