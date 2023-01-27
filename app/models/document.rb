class Document < ActiveRecord::Base
	belongs_to :task
	has_attached_file :file
	validates_attachment_content_type :file, content_type: %w(text/plain application/text.txt application/zip application/msword application/vnd.ms-office application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet)
end
