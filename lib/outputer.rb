# frozen_string_literal: true

class Outputer
  def initialize(processed_data)
    @processed_data = processed_data
  end

  def call
    output_processed_data
  end

  private

  attr_reader :processed_data

  def output_processed_data
    puts "First record: #{first_record}"
    puts "Last record: #{last_record}"
    puts processed_data.join(' | ')
  end

  def first_record
    processed_data.first
  end

  def last_record
    processed_data.last
  end
end
