class Result < ActiveRecord::Base
  validates :text, presence: true
  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain", "application/zip", "application/x-compressed-zip"] }
end
