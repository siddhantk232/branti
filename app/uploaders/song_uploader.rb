class SongUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[audio/webm audio/mpeg]
  end
end

