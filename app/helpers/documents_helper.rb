module DocumentsHelper

  def file_format(document)
    FriendlyNumbers.number_to_human_size(document.file_file_size)
  end

end
