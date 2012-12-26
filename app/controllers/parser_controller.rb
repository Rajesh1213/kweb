require "rexml/document"
class ParserController < ApplicationController
  def parse(current_user)
  	docxmlpath = "public/resumes/#{current_user.id}/original/word/document.xml"

    # get the XML data as a string and extract information
    xml_data = File.read(docxmlpath)
    doc = REXML::Document.new(xml_data)
    @resume_content = ""
    @resume_content = parse_document_to_get_data(doc)
    return @resume_content
  end

  def parse_document_to_get_data(doc)
  	doc.elements["w:document/w:body"].each do |body_element|
  	  # logger.info"BODY ELEMENT #{body_element.inspect}"
  	  # logger.info"BODY ELEMENT.elements['w:r'] #{body_element.elements['w:r'].inspect}"
      resume_content = extract_text_from_document(body_element)
      extract_table_content_from_document(body_element)
      unless resume_content.nil? or resume_content.blank?
        # logger.info"resume_content #{resume_content.inspect}"
        @resume_content = @resume_content + resume_content
      end
    end
    # logger.info"FINAL @resume_content #{@resume_content.inspect}"
    return @resume_content
  end

  def extract_text_from_document(body_element)
  	unless body_element.elements["w:r"].nil?
  	  resume_content = ""
  	  resume_content = get_content_text(body_element,resume_content)
  	  # logger.info"resume_content #{resume_content.inspect}"
  	end
    unless resume_content.nil? or resume_content.blank?
      return resume_content
    end
  end

  def extract_table_content_from_document(body_element)
  	
  end

  def get_content_text(body_element,resume_content)
  	body_element.elements.each("w:r") do |run_element|
  	  run_element.elements.each("w:t") do |text_element|
  	  	resume_content = resume_content + text_element.text
  	  end
  	end

  	unless resume_content.nil? or resume_content.blank?
      resume_content = resume_content + "<br/>"
    end

    return resume_content
  end

end