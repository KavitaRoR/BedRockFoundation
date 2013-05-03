class LibraryFile < ActiveRecord::Base
	attr_accessible :job_id, :library_file, :file_type, :file_size, :file_url
	belongs_to :job

  CT_PDF        = 'application/pdf'
  CT_DOC        = 'application/msword'
  CT_DOCX       = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  CT_PPT        = 'application/vnd.ms-powerpoint'
  CT_PPTX       = 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
  CT_XLS        = 'application/vnd.ms-excel'
  CT_XLSX       = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  CT_RTF        = 'text/rtf'
  CT_PLAIN      = 'text/plain'
  CT_PAGES      = 'application/vnd.apple.pages'
  CT_NUMBERS    = 'application/vnd.apple.numbers'
  CT_KEYNOTE    = 'application/vnd.apple.keynote'
  CT_ZIP        = 'application/zip' 
end
