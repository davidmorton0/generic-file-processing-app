# frozen_string_literal: true

class FileImporter
  FILENAME = 'input.txt'

  def initialize(filename: FILENAME)
    @filename = filename
    exit_with('Filename cannot be nil') unless filename
    return if File.exist?("#{Dir.pwd}/input_files/#{filename}")

    exit_with("#{filename} - File not found in input_files directory")
  end

  def call
    import_data
  end

  private

  attr_reader :filename

  def exit_with(message)
    puts message
    exit
  end

  def import_data
    file = File.open("#{Dir.pwd}/input_files/#{filename}")
    data = []

    while (line = file.gets)
      data += process_line(line)
    end

    file.close
    data
  end

  def process_line(line)
    line.split(',').map(&:to_i)
  end
end
