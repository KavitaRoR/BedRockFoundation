module DocumentLibraryHelper

  def icon_type(mime_type)
  	logger.info "#{mime_type}"
    case mime_type
    when LibraryFile::CT_PDF then image_tag('document_types/pdf_24.png')
    when LibraryFile::CT_DOC then image_tag('document_types/doc_24.png')
    when LibraryFile::CT_DOCX then image_tag('document_types/docx_24.png')
    when LibraryFile::CT_PPT then image_tag('document_types/pptx_24.png')
    when LibraryFile::CT_PPTX then image_tag('document_types/pptx_24.png')
    when LibraryFile::CT_XLS then image_tag('document_types/xlsx_24.png')
    when LibraryFile::CT_XLSX then image_tag('document_types/xlsx_24.png')
    when LibraryFile::CT_RTF then image_tag('document_types/text_24.png')
    when LibraryFile::CT_PLAIN then image_tag('document_types/text_24.png')
    when LibraryFile::CT_PAGES then image_tag('document_types/pages_24.png')
    when LibraryFile::CT_NUMBERS then image_tag('document_types/numbers_24.png')
    when LibraryFile::CT_KEYNOTE then image_tag('document_types/keynote_24.png')
    when LibraryFile::CT_ZIP then image_tag('document_types/zip_24.png')
    end
  end

end
