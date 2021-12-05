# frozen_string_literal: true

class Main
  KEY = 11

  def initialize(filename)
    @filename = filename
    set_dependencies
  end

  def call
    import_data
    process_data
    output_processed_data
  end

  private

  attr_reader :data, :filename, :processed_data, :file_importer, :outputer, :processor

  def import_data
    @data = file_importer.new(filename: filename).call
  end

  def process_data
    @processed_data = processor.new(data, KEY).call
  end

  def output_processed_data
    outputer.new(processed_data).call
  end

  def set_dependencies
    @file_importer = FileImporter
    @outputer = Outputer
    @processor = Processor
  end
end
